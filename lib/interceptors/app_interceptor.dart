import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/config/config.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/push_notification_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class AppInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final _secureStorageService = locator<SecureStorageService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _pushNotificationService = locator<PushNotificationService>();

  AppInterceptor(this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey("requires-token")) {
      //remove the auxiliary header
      options.headers.remove("requires-token");

      var token = await _secureStorageService.readString(StorageKeys.TOKEN);
      options.headers.addAll({"Authorization": "Bearer " + (token ?? '')});
    }
    handler.next(options);
  }

  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    try {
      print(dioError.response?.statusCode);
      if (dioError.response?.statusCode == 401) {
        try {
          _dio.lock();
          RequestOptions options = dioError.requestOptions;
          final newToken = await _refrshToken();
          options.headers["Authorization"] = "Bearer " + newToken;
          _dio.unlock();

          // request again with refreshed token
          final Response response = await _dio.fetch(options);
          return handler.resolve(response);
        } catch (e) {
          _dio.unlock();
          await signOut();
          print('failed to refresh token => $e');
        }
      } else if (dioError.response?.statusCode == 500) {
        return handler.reject(DioError(
          error:
              'حدث خطأ أثناء محاولة تنفيذ طلبك ، نرجو المحاولة في وقت مرة أخر او الاتصال بمسؤول النظام.',
          requestOptions: dioError.requestOptions,
        ));
      } else if (dioError.response != null) {
        return handler.reject(DioError(
          error: dioError.response?.data,
          requestOptions: dioError.requestOptions,
        ));
      } else if (dioError.error is SocketException) {
        return handler.reject(DioError(
          error: 'لم نتمكن من الاتصال بالخدمة ،نرحو التحقق من اتصالك بالشبكة.',
          requestOptions: dioError.requestOptions,
        ));
      } else
        return handler.next(dioError);
    } catch (e) {
      return handler.reject(DioError(
        error: 'حدث خطأ أثناء محاولة الاتصال بالخدمة.',
        requestOptions: dioError.requestOptions,
      ));
    }
  }

  Future<void> signOut() async {
    await _userService.clearUser();
    await _pushNotificationService.unSubscribeFromDefaultTopic();
    await _navigationService.pushNamedAndRemoveUntil(Routes.signInView);
  }

  Future<String> _refrshToken() async {
    try {
      var credintailsJson =
          await _secureStorageService.readString(StorageKeys.CREDENTIALS);
      if (credintailsJson == null) return '';
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
