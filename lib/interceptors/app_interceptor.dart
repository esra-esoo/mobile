import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/config/config.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class AppInterceptor extends Interceptor {
  final Dio _dio;
  final _secureStorageService = locator<SecureStorageService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  AppInterceptor(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requires-token")) {
      //remove the auxiliary header
      options.headers.remove("requires-token");

      var token = await _secureStorageService.readString(StorageKeys.TOKEN);
      options.headers.addAll({"Authorization": "Bearer " + token});
      return options;
    }
  }

  @override
  Future onError(DioError dioError) async {
    try {
      if (dioError?.response?.statusCode == 401) {
        try {
          _dio.interceptors.requestLock.lock();
          _dio.interceptors.responseLock.lock();
          RequestOptions options = dioError.response.request;

          final newToken = await _refrshToken();

          options.headers["Authorization"] = "Bearer " + newToken;
          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();
          print('token was refreshed successfully');

          return _dio.request(options.path, options: options);
        } catch (e) {
          print('AppInterceptor refresh token => $e');
          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();

          await signOut();
        }
      } else if (dioError?.response?.statusCode == 500) {
        return _dio.reject(
            'حدث خطأ أثناء محاولة تنفيذ طلبك ، نرجو المحاولة في وقت مرة أخر او الاتصال بمسؤول النظام.');
      } else if (dioError.response != null) {
        return _dio.reject(dioError?.response?.data);
      } else if (dioError.error is SocketException) {
        return _dio.reject(
            'لم نتمكن من الاتصال بالخدمة ،نرحو التحقق من اتصالك بالشبكة.');
      } else
        return dioError;
    } catch (e) {
      return _dio.reject('حدث خطأ أثناء محاولة الاتصال بالخدمة.');
    }
  }

  Future<void> signOut() async {
    await _userService.clearUser();
    await _navigationService.pushNamedAndRemoveUntil(Routes.signInView);
  }

  Future<String> _refrshToken() async {
    try {
      var credintailsJson =
          await _secureStorageService.readString(StorageKeys.CREDENTIALS);
      var credentials = oauth2.Credentials.fromJson(credintailsJson);
      var newCredentials = await credentials.refresh(
        identifier: Config.identifier,
        secret: Config.secret,
      );
      await _secureStorageService.addString(
        StorageKeys.CREDENTIALS,
        newCredentials.toJson(),
      );
      await _secureStorageService.addString(
        StorageKeys.TOKEN,
        newCredentials.accessToken,
      );
      await _userService.update(
        User.fromToken(newCredentials.accessToken),
      );
      print('new Credintails has been granted !!');
      return newCredentials.accessToken;
    } catch (e) {
      throw e;
    }
  }
}
