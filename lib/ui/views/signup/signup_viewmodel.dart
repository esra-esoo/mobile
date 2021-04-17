import 'package:email_validator/email_validator.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:huayati/ui/views/signup/signup_view.form.dart';
import 'package:huayati/extensions/string_extensions.dart';

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  List<String> _accountTypes = ['شركة', 'فرد'];
  List<String> get accountTypes => _accountTypes;

  String _selectedType;
  String get selectedType => _selectedType;

  @override
  void setFormStatus() {}

  Future saveData() async {
    if ((phoneValue?.isEmpty ?? true)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'يرجى ملء كافة الحقول المطلوبة (*)',
      );
    } else if (!phoneValue.isValidPhonenumber) {
      _snackbarService.showTopErrorSnackbar(
        message: 'رقم الهاتف يجب ان يكون بصيغة (9xxxxxxxx)',
      );
    } else if (emailValue != null &&
        emailValue.length > 0 &&
        !EmailValidator.validate(emailValue)) {
      _snackbarService.showTopErrorSnackbar(
        message: 'البريد الالكتروني غير صحيح !',
      );
    } else if (_selectedType == null) {
      _snackbarService.showTopErrorSnackbar(
        message: 'يجب أختيار نوع المستخدم !',
      );
    } else {
      // TODO submit
    }
  }

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
    _navigationService.replaceWith(
      Routes.signInView,
    );
  }

  void onAccountTypeChanged(String value) {
    _selectedType = value;
    notifyListeners();
  }
}
