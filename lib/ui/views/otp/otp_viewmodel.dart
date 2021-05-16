import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/services/auth_service.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarsService _snackbarService = locator<SnackBarsService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();

  Future verifyUser(String? phoneNo, int verificationCode) async {
    if (verificationCode.toString().length < 6) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو منك ملء كافة الخانات ..',
      );
    } else {
      try {
        await runBusyFuture(
          _authService.checkSignUpVerificationCode(
            phoneNumber: phoneNo,
            verificationCode: verificationCode,
          ),
          throwException: true,
        );

        await _dialogService.showCustomDialog(
          variant: DialogType.alert,
          title: 'نجحت العملية',
          description:
              'لقد تم إسال بيانات المستخدم إلى هاتف $phoneNo ،يمكنك الان تسجيل الدخول.',
          mainButtonTitle: 'تسجيل الدخول',
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
    String? email,
    required String phoneNumber,
    required int customerType,
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
