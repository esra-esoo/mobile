import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final _secureStorageService = locator<SecureStorageService>();

  AuthInterceptor(this._dio);

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
  Future onError(DioError error) async {
    try {
      if (error.response != null) {
        return _dio.reject(error.response.data);
      } else if (error.error is SocketException) {
        return _dio.reject(
            'لم نتمكن من الاتصال بالخدمة ،نرحو التحقق من اتصالك بالشبكة.');
      } else
        return error;
    } catch (e) {
      return _dio.reject('حدث خطأ أثناء محاولة الاتصال بالخدمة.');
    }
  }
}
