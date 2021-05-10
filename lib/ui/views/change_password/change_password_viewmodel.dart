import 'package:huayati/app/app.locator.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/auth_service.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

import 'package:huayati/extensions/string_extensions.dart';

import 'change_password_view.form.dart';

class ChangePasswordViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackBarsService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();

  @override
  void setFormStatus() {}

  Future saveData() async {
    if ((currentPasswordValue?.isEmpty ?? true) ||
        (passwordValue?.isEmpty ?? true) ||
        (confirmPasswordValue?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'الرجاء إدخال كافة الحقول',
      );
    } else if (!passwordValue.isStrongPassword) {
      _snackbarService.showTopErrorSnackbar(
        message: 'كلمة المرور الجديدة غير مطابقة للشروط أعلاه',
      );
    } else if (passwordValue != confirmPasswordValue) {
      _snackbarService.showTopErrorSnackbar(
        message: 'حقل التأكيد غير مطابق لكلمة المرور',
      );
    } else {
      var response = await _dialogService.showCustomDialog(
        variant: DialogType.confirm,
        title: 'تأكيد العملية',
        description: 'هل أنت متأكد من رغبتك في حفظ التعديلات ؟',
      );
      if (!response.confirmed) return;
      try {
        await runBusyFuture(
          _authService.changePassword(
            currentPassword: currentPasswordValue,
            password: passwordValue,
            confirmPassword: confirmPasswordValue,
          ),
          throwException: true,
        );

        _navigationService.back(
            result: NavigationResult(
          success: true,
          message: 'لقد تم تغيير كلمة المرور بنجاح !',
        ));
      } catch (e) {
        print(e.toString());
        _snackbarService.showBottomErrorSnackbar(message: e.toString());
      }
    }
  }
}
