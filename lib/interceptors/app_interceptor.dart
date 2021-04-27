import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/services/api.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';

class AppInterceptor extends Interceptor {
  final Dio _dio;
  final _secureStorageService = locator<SecureStorageService>();
  final _navigationService = locator<NavigationService>();

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
      if (dioError.response?.statusCode == 401) {
        try {
          _dio.interceptors.requestLock.lock();
          _dio.interceptors.responseLock.lock();

          RequestOptions options = dioError.response.request;
          final newToken = 'await _refreshToken()';
          // TODO refresh token
          //
          options.headers["Authorization"] = "Bearer " + newToken;

          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();
          print('token was refreshed successfully');
          return _dio.request(locator<Api>().endpoint, options: options);
        } catch (e) {
          print('AppInterceptor refresh token => $e');
          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();
          
          await _secureStorageService.deleteAll();
          await _navigationService.pushNamedAndRemoveUntil(Routes.signInView);
        }
      } else if (dioError.response != null) {
        return _dio.reject(dioError.response.data);
      } else if (dioError.error is SocketException) {
        return _dio.reject(
            'لم نتمكن من الاتصال بالخدمة ،نرحو التحقق من اتصالك بالشبكة.');
      } else
        return dioError;
    } catch (e) {
      return _dio.reject('حدث خطأ أثناء محاولة الاتصال بالخدمة.');
    }
  }
}
