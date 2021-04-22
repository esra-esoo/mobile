import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/signin/signin_view.form.dart';
import 'package:huayati/ui/widgets/success_upload_modal.dart';
import 'package:stacked/stacked.dart';
import 'package:huayati/extensions/string_extensions.dart';

class SignInViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void setFormStatus() {}

  Future saveData() async {
    print(phoneValue);
    print(passwordValue);
    if ((phoneValue?.isEmpty ?? true) || (passwordValue?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'كل الحقول مطلوبة !',
      );
    } else if (!phoneValue.isValidPhonenumber) {
      _snackbarService.showTopErrorSnackbar(
        message: 'رقم الهاتف يجب ان يكون بصيغة (9xxxxxxxx)',
      );
    } else {
      await _showSuccessModal();
      // TODO submit
    }
  }

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
    await _navigationService.replaceWith(
      Routes.signUpView,
    );
  }

  Future recoverPassword() async {}

  Future _showSuccessModal() async {
    await showGeneralDialog(
      context: Get.overlayContext,
      barrierColor: Colors.white,
      barrierDismissible: false,
      barrierLabel: "success dialog",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => SuccessUploadModal(),
    );
  }
}
