import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  Future verifyUser(String userId, String pinCode) async {
    if (pinCode.length < 6) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو ملء كافة الخانات ..',
      );
    } else {
      // TODO submit
    }
  }

  Future<void> navigatoToStartUpView() async {
    await _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }

  Future<void> resendCode(String userId) async {
    // try {
    //   final String message = await runBusyFuture(
    //     _authService.resendVerificationCode(userId: userId),
    //     throwException: true,
    //   );
    //   _snackbarService.showTopInfoSnackbar(
    //     message: message,
    //   );
    // } catch (e) {
    //   print(e);
    //   _snackbarService.showBottomErrorSnackbar(
    //     message: e.toString(),
    //   );
    // }
  }

  void closeScreen() async {
    await _navigationService.back();
  }
}
