import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:huayati/config/config.dart';
import 'package:huayati/interceptors/app_interceptor.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class Api {
  final Dio _dio = Dio();
  final String endpoint;

  Api(this.endpoint) {
    _dio.interceptors.add(AppInterceptor(_dio));
  }

  Future<oauth2.Client> getClient({
    @required String username,
    @required String password,
  }) async {
    return await oauth2.resourceOwnerPasswordGrant(
      Uri.parse(Config.authorizationEndpoint),
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
      final response = await _dio.post(
        Config.authenticationEndpoint + url,
        data: data,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future putCallAuth({@required String url, @required dynamic data}) async {
    try {
      final response = await _dio.put(
        Config.authenticationEndpoint + url,
        data: data,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future getCallAuth({@required String url}) async {
    try {
      final response = await _dio.get(
        Config.authenticationEndpoint + url,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future postCall({@required String url, @required dynamic data}) async {
    try {
      final response = await _dio.post(
        endpoint + url,
        data: data,
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
