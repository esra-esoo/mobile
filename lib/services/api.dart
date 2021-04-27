import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class Api {
  final _dio = Dio();
  final endpoint;
  final authorizationEndpoint =
      Uri.parse('https://mobile.tatweer.ly:5001/connect/token');

  final identifier = 'mobile.client';
  final secret = '44f37caf-831a-45b8-92a4-8d829f36beb5';
  final scopes = [
    'phone',
    'customergate.fullaccess',
    'customerApi.fullaccess',
    'offline_access',
  ];

  Api(this.endpoint);

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

  Future<oauth2.Client> getClient({
    @required String username,
    @required String password,
  }) async {
    return await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint,
      username,
      password,
      identifier: identifier,
      secret: secret,
      scopes: scopes,
    );
  }
}
