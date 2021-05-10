import 'package:email_validator/email_validator.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/models/profile_info.dart';
import 'package:huayati/services/auth_service.dart';

import 'package:stacked_services/stacked_services.dart' ;
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/profile/edit_form/edit_profile_view.form.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackBarsService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  ProfileInfo profileInfo;

  Future<void> initilizeView(ProfileInfo profile) async {
    if (profile != null) {
      profileInfo = profile;
      notifyListeners();
      return;
    }
    try {
      profileInfo = await runBusyFuture(
        _authService.getProfileInfo(),
        throwException: true,
      );
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      _navigationService.back(
        result: NavigationResult(
          success: false,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  void setFormStatus() {}

  Future<void> saveData() async {
    if ((fullnameValue?.trim()?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو إدخال الاسم كامل',
      );
      return;
    } else if ((fullnameValue.trim().length < 5)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'يجب أن يكون طول الاسم كامل  من 5 إلى 40 حرف',
      );
      return;
    } else if ((familyNameValue?.trim()?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'نرجو إدخال اللقب',
      );
      return;
    } else if (emailValue != null &&
        emailValue.length > 0 &&
        !EmailValidator.validate(emailValue)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'البريد الالكتروني غير صحيح !',
      );
      return;
    }
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
      title: 'تأكيد العملية',
      description: 'هل أنت متأكد من رغبتك في حفظ التعديلات ؟',
    );
    if (!response.confirmed) return;
    await _updateProfile();
  }

  Future<void> _updateProfile() async {
    try {
      var updatedProfile = ProfileInfo(
        phoneNumber: profileInfo.phoneNumber,
        username: profileInfo.username,
        fullname: fullnameValue,
        familyName: familyNameValue,
        email: emailValue,
      );
      print(updatedProfile.toJson());
      await runBusyFuture(
        _authService.updateProfileInfo(profileInfo: updatedProfile),
        throwException: true,
      );

      _navigationService.back(result: updatedProfile);
    } catch (e) {
      print(e.toString());
      _snackbarService.showBottomErrorSnackbar(message: e.toString());
    }
  }
}
