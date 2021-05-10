import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/app_config.dart';
import 'package:huayati/config/config.dart';
import 'package:huayati/interceptors/app_interceptor.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.interceptors.add(AppInterceptor(_dio));
  }

  Future<oauth2.Client> getClient({
    @required String username,
    @required String password,
  }) async {
    var authEndpoint = AppConfig.of(Get.context).authEndpoint;
    return await oauth2.resourceOwnerPasswordGrant(
      Uri.parse(authEndpoint + '/connect/token'),
      username,
      password,
      identifier: Config.identifier,
      secret: Config.secret,
      scopes: Config.scopes,
      onCredentialsRefreshed: (_) {
        print('onCredentialsRefreshed');
      },
    );
  }

  Future postCallAuth({@required String url, @required dynamic data}) async {
    try {
      var authEndpoint = AppConfig.of(Get.context).authEndpoint;
      final response = await _dio.post(
        authEndpoint + url,
        data: data,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future putCallAuth({@required String url, @required dynamic data}) async {
    try {
      var authEndpoint = AppConfig.of(Get.context).authEndpoint;
      final response = await _dio.put(
        authEndpoint + url,
        data: data,
        options: Options(
          headers: {"requires-token": true},
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future getCallAuth({@required String url}) async {
    try {
      var authEndpoint = AppConfig.of(Get.context).authEndpoint;
      final response = await _dio.get(
        authEndpoint + url,
        options: Options(
          headers: {"requires-token": true},
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future postCallWithToken({
    @required String url,
    @required dynamic data,
  }) async {
    try {
      var endpoint = AppConfig.of(Get.context).endpoint;
      final response = await _dio.post(
        endpoint + url,
        data: data,
        options: Options(
          headers: {"requires-token": true},
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future putCallWithToken({
    @required String url,
    @required dynamic data,
  }) async {
    try {
      var endpoint = AppConfig.of(Get.context).endpoint;
      final response = await _dio.put(
        endpoint + url,
        data: data,
        options: Options(
          headers: {"requires-token": true},
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future getCallWithToken({
    @required String url,
  }) async {
    try {
      var endpoint = AppConfig.of(Get.context).endpoint;
      final response = await _dio.get(
        endpoint + url,
        options: Options(
          headers: {"requires-token": true},
        ),
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }
}
