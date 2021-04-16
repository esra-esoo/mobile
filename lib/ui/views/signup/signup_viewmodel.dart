import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void setFormStatus() {}

  Future saveData() async {}

  Future<void> navigatoToVerificationView(String userId, String phone) async {
    // await _navigationService.pushNamedAndRemoveUntil(
    //   Routes.verificationView,
    //   arguments: VerificationViewArguments(
    //     userId: userId,
    //     phoneNo: phone,
    //     fromBagView: _fromBagView,
    //   ),
    // );
  }

  void navigatoToSingInView() {
    _navigationService.navigateTo(
      Routes.signInView,
    );
  }
}
