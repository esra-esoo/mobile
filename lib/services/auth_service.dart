import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/customer_created_result.dart';
import 'package:huayati/models/signup_result.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/api.dart';
import 'package:huayati/services/user_service.dart';

import 'third_party/secure_storage_service.dart';

class AuthService {
  final _api = locator<Api>();
  final _secureStorageService = locator<SecureStorageService>();
  final _userService = locator<UserService>();

  Future<SignUpResult> signUp({
    String email,
    @required String phoneNumber,
    @required int customerType,
  }) async {
    try {
      final response = await _api.postCall(
        url: '/api/Users/SignUp',
        data: {
          "email": email,
          "phoneNumber": phoneNumber,
          'customerType': customerType,
        },
      );
      if (response['verificationCode'] == null)
        throw 'حدث خطأ نرجو المحاولة مرة اخر،او في وقت لاحق.';
      else
        return SignUpResult.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<CustomerCreatedResult> checkSignUpVerificationCode({
    @required String phoneNumber,
    @required int verificationCode,
  }) async {
    try {
      final response = await _api.postCall(
        url: '/api/SignUpVerificationCode/CheckSignUpVerificationCode',
        data: {
          "phoneNumber": phoneNumber,
          'verificationCode': verificationCode,
        },
      );
      if (response['phoneNumber'] == null)
        throw 'حدث خطأ نرجو المحاولة مرة اخر،او في وقت لاحق.';
      else
        return CustomerCreatedResult.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signIn({
    @required String username,
    @required String password,
  }) async {
    try {
      var client = await _api.getClient(
        username: username,
        password: password,
      );
      await _secureStorageService.addString(
        StorageKeys.TOKEN,
        client.credentials.accessToken,
      );
      await _secureStorageService.addString(
        StorageKeys.CREDENTIALS,
        client.credentials.toJson(),
      );
      await _userService.addUser(
        User.fromToken(client.credentials.accessToken),
      );
      print(client.credentials.toJson());
    } on DioError catch (e) {
      throw e.message;
    } on Exception catch (e) {
      print(e);
    } catch (e) {
      throw e;
    }
  }
}