import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void setFormStatus() {}

  bool get canGoBack => _navigationService.canGoBack();

  Future saveData() async {}

  Future<void> navigatoToStartUpView() async {
    await _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }

  Future<void> navigatoToVerificationView() async {
    // await _navigationService.pushNamedAndRemoveUntil(
    //   Routes.verificationView,
    //   arguments: VerificationViewArguments(
    //     phoneNo: _user.phone,
    //     userId: _user.id,
    //   ),
    // );
  }

  Future navigateToSignUpScreen() async {
    await _navigationService.navigateTo(
      Routes.signUpView,
    );
  }

  recoverPassword() {}
}
