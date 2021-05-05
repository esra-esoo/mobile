import 'package:huayati/app/locator.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  @override
  void setFormStatus() {}

  Future<void> saveData() async {}
}
