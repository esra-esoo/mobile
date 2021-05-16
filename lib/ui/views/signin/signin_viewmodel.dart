import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/consts/pass_sent_by.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/shared_service.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:huayati/services/third_party/picker_services.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/signin/signin_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:huayati/extensions/string_extensions.dart';

class SignInViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackBarsService _snackbarService = locator<SnackBarsService>();
  final AuthService _authService = locator<AuthService>();
  final SharedService _sharedService = locator<SharedService>();
  final PickerService _pickerService = locator<PickerService>();
  final DialogService _dialogService = locator<DialogService>();

  @override
  void setFormStatus() {}

  Future saveData() async {
    if ((phoneValue?.isEmpty ?? true) || (passwordValue?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'كل الحقول مطلوبة !',
      );
    } else if (!phoneValue!.isValidPhonenumber) {
      _snackbarService.showTopErrorSnackbar(
        message: 'رقم الهاتف يجب ان يكون بصيغة (9xxxxxxxx)',
      );
    } else {
      try {
        setBusy(true);
        await _authService.signIn(
          username: phoneValue!,
          password: passwordValue!,
        );
        await _sharedService.updateAccountInfo();
        await _sharedService.getRefuseState();
        //TODO send FCM token to be

        await _navigationService.pushNamedAndRemoveUntil(
          Routes.startUpView,
        );
      } catch (e) {
        setBusy(false);
        print(e.toString());
        _snackbarService.showBottomErrorSnackbar(message: e.toString());
      }
    }
  }

  Future<void> navigatoToStartUpView() async {
    await _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }

  Future navigateToSignUpScreen() async {
    await _navigationService.replaceWith(
      Routes.signUpView,
    );
  }

  Future recoverPassword() async {
    var resetMethod = await _pickerService.showResetMethod();
    if (resetMethod != null) {
      DialogResponse? dialogResponse = await _dialogService.showCustomDialog(
        variant: DialogType.phoneOrEmail,
        customData: resetMethod == SentByValue.EMAIL,
      );
      if (dialogResponse == null) return;
      if (dialogResponse.confirmed && dialogResponse.responseData != null) {
        await _forgetPassword(dialogResponse.responseData, resetMethod);
      }
    }
  }

  Future<void> _forgetPassword(
      String phoneNumberOrEmail, int resetMethod) async {
    try {
      await runBusyFuture<void>(
        _authService.forgotPassword(
          phoneNumberOrEmail: phoneNumberOrEmail,
          resetMethod: resetMethod,
        ),
        throwException: true,
      );
      await _navigationService.pushNamedAndRemoveUntil(
        Routes.forgetPasswordView,
        arguments: ForgetPasswordViewArguments(
          phoneNumberOrEmail: phoneNumberOrEmail,
          sentBy: resetMethod,
        ),
      );
    } catch (e) {
      print(e.toString());
      _snackbarService.showBottomErrorSnackbar(message: e.toString());
    }
  }
}
