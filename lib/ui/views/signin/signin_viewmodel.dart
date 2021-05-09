import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/pass_sent_by.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/picker_services.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/signin/signin_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:huayati/extensions/string_extensions.dart';

class SignInViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _authService = locator<AuthService>();
  final _sharedService = locator<SharedService>();
  final _pickerService = locator<PickerService>();
  final _dialogService = locator<DialogService>();

  @override
  void setFormStatus() {}

  Future saveData() async {
    if ((phoneValue?.isEmpty ?? true) || (passwordValue?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'كل الحقول مطلوبة !',
      );
    } else if (!phoneValue.isValidPhonenumber) {
      _snackbarService.showTopErrorSnackbar(
        message: 'رقم الهاتف يجب ان يكون بصيغة (9xxxxxxxx)',
      );
    } else {
      try {
        await runBusyFuture(
          _authService.signIn(
            username: phoneValue,
            password: passwordValue,
          ),
          throwException: true,
        );

        await _sharedService.getRefuseState();

        await _navigationService.pushNamedAndRemoveUntil(
          Routes.startUpView,
        );
      } catch (e) {
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
      DialogResponse dialogResponse =
          await _dialogService.showPhoneOrEmailDialog(
        isEmail: resetMethod == SentByValue.EMAIL,
      );
      if (dialogResponse.confirmed && dialogResponse.responseData[0] != null) {
        await _forgetPassword(dialogResponse.responseData[0], resetMethod);
      }
    }
  }

  Future _forgetPassword(String phoneNumberOrEmail, int resetMethod) async {
    try {
      await runBusyFuture(
        _authService.forgotPassword(
          phoneNumberOrEmail: null,
          resetMethod: null,
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
