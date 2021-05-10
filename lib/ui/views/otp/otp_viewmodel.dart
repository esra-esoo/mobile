import 'package:flutter/foundation.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/models/customer_created_result.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:stacked_services/stacked_services.dart' as stacked_services;
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  final _navigationService = locator<stacked_services.NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  Future verifyUser(String phoneNo, int verificationCode) async {
    if (verificationCode.toString().length < 6) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو منك ملء كافة الخانات ..',
      );
    } else {
      try {
        CustomerCreatedResult result = await runBusyFuture(
          _authService.checkSignUpVerificationCode(
            phoneNumber: phoneNo,
            verificationCode: verificationCode,
          ),
          throwException: true,
        );

        print(result.toJson());

        await _dialogService.showAlertDialog(
          title: 'نجحت العملية',
          description:
              'لقد تم إسال بيانات المستخدم إلى هاتف $phoneNo ،يمكنك الان تسجيل الدخول.',
          closeTitle: 'تسجيل الدخول',
        );
        await _navigationService.pushNamedAndRemoveUntil(
          Routes.signInView,
          arguments: SignInViewArguments(phoneNumber: phoneNo),
        );
      } catch (e) {
        print(e);
        _snackbarService.showBottomErrorSnackbar(
          message: e.toString(),
        );
      }
    }
  }

  Future<bool> resendCode({
    String email,
    @required String phoneNumber,
    @required int customerType,
  }) async {
    try {
      await runBusyFuture(
        _authService.signUp(
          email: email,
          phoneNumber: phoneNumber,
          customerType: customerType,
        ),
        throwException: true,
      );
      _snackbarService.showTopSuccessSnackbar(
        message: 'تم طلب رمز التفعيل بنجاح ، ستصلك رسالة على رقم هاتفك.',
      );
      return true;
    } catch (e) {
      print(e);
      _snackbarService.showBottomErrorSnackbar(
        message: e.toString(),
      );
      return false;
    }
  }

  Future closeScreen() async {
    await _navigationService.pushNamedAndRemoveUntil(Routes.signUpView);
  }
}
