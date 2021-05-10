import 'package:flutter/foundation.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/consts/pass_sent_by.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/services/auth_service.dart';

import 'package:stacked_services/stacked_services.dart' ;
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackBarsService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  Future verifyOtp({
    @required String phoneNumberOrEmail,
    @required int verificationCode,
    @required int sentBy,
  }) async {
    String sentByString = sentBy == SentByValue.SMS ? SentBy.SMS : SentBy.EMAIL;
    if (verificationCode.toString().length < 6) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو منك ملء كافة الخانات ..',
      );
    } else {
      try {
        await runBusyFuture(
          _authService.checkVerificationCode(
            phoneNumberOrEmail: phoneNumberOrEmail,
            verificationCode: verificationCode,
            sentBy: sentByString,
          ),
          throwException: true,
        );

        await _dialogService.showCustomDialog(
          variant: DialogType.alert,
          title: 'نجحت العملية',
          description:
              'يمكنك الان تسجيل الدخول بإستخدام كلمة المرور الجديدة التي تم إسالها إليك عبر $sentByString',
          mainButtonTitle: 'تسجيل الدخول',
        );

        await _navigationService.pushNamedAndRemoveUntil(
          Routes.signInView,
          arguments: sentBy == SentByValue.SMS
              ? SignInViewArguments(phoneNumber: phoneNumberOrEmail)
              : null,
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
    @required String phoneNumberOrEmail,
    @required int sentBy,
  }) async {
    try {
      await runBusyFuture(
        _authService.resendVerificationCode(
          phoneNumberOrEmail: phoneNumberOrEmail,
          sentBy: sentBy == SentByValue.SMS ? SentBy.SMS : SentBy.EMAIL,
        ),
        throwException: true,
      );
      _snackbarService.showTopSuccessSnackbar(
        message: sentBy == SentByValue.SMS
            ? 'تم طلب رمز التحقق من جديد، ستصلك رسالة على رقم هاتفك.'
            : 'تم طلب رمز التحقق من جديد، ستصلك رسالة على البريد الالكتروني.',
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
    await _navigationService.pushNamedAndRemoveUntil(Routes.signInView);
  }
}
