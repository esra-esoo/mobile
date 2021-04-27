import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/signup_result.dart';
import 'package:huayati/services/api.dart';

import 'third_party/secure_storage_service.dart';

class AuthService {
  final _api = locator<Api>();
  final _secureStorageService = locator<SecureStorageService>();

  Future<SignUpResult> signUp({
    String email,
    String phoneNumber,
    int customerType,
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
        throw 'error';
      else
        return SignUpResult.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }
}
