import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/customer_created_result.dart';
import 'package:huayati/models/profile_info.dart';
import 'package:huayati/models/signup_result.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/api.dart';

import 'third_party/secure_storage_service.dart';
import 'user_service.dart';

class AuthService {
  final _api = locator<Api>();
  final _secureStorageService = locator<SecureStorageService>();
  final _userService = locator<UserService>();

  Future<SignUpResult> signUp({
    String email,
    @required String phoneNumber,
    @required int customerType,
  }) async {
    print({
      "email": email,
      "phoneNumber": phoneNumber,
      'customerType': customerType,
    });
    try {
      final response = await _api.postCallAuth(
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
      final response = await _api.postCallAuth(
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
    } on DioError catch (e) {
      throw e.message;
    } on Exception catch (e) {
      print(e);
      throw 'نرجو التحقق من البيانات التي ادخلتها';
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileInfo> getProfileInfo() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      final response = await _api.getCallAuth(url: '/api/Users/ProfileInfo');

      if (response['phoneNumber'] == null)
        throw 'حدث خطأ نرجو المحاولة مرة اخر،او في وقت لاحق.';
      else
        return ProfileInfo.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateProfileInfo({@required ProfileInfo profileInfo}) async {
    try {
      await _api.putCallAuth(
        url: '/api/Users/ProfileInfo',
        data: profileInfo,
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> changePassword({
    @required String currentPassword,
    @required String password,
    @required String confirmPassword,
  }) async {
    try {
      await _api.putCallAuth(
        url: '/api/Users/ChangePassword',
        data: {
          "currentPassword": currentPassword,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> forgotPassword({
    @required String phoneNumberOrEmail,
    @required int resetMethod,
  }) async {
    try {
      await _api.postCallAuth(
        url: '/api/ForgetPasswordVerificationCode/ForgotPassword',
        data: {
          "phoneNumberOrEmail": phoneNumberOrEmail,
          "resetMethod": resetMethod,
        },
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> resendVerificationCode({
    @required String phoneNumberOrEmail,
    @required String sentBy,
  }) async {
    try {
      await _api.postCallAuth(
        url: '/api/ForgetPasswordVerificationCode/ResendVerificationCode',
        data: {
          "phoneNumberOrEmail": phoneNumberOrEmail,
          "sentBy": sentBy,
        },
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> checkVerificationCode({
    @required String phoneNumberOrEmail,
    @required int verificationCode,
    @required String sentBy,
  }) async {
    try {
      await _api.postCallAuth(
        url: '/api/ForgetPasswordVerificationCode/CheckVerificationCode',
        data: {
          "phoneNumberOrEmail": phoneNumberOrEmail,
          "verificationCode": verificationCode,
          "sentBy": sentBy,
        },
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }
}
