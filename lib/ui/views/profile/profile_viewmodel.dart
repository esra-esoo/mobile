import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app.router.dart';
import 'package:huayati/models/profile_info.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:stacked_services/stacked_services.dart'hide SnackbarService;
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  ProfileInfo profileInfo;

  Future<void> initilizeView() async {
    try {
      profileInfo = await runBusyFuture(
        _authService.getProfileInfo(),
        throwException: true,
      );
    } catch (e) {
      print(e);
      _snackbarService.showBottomErrorSnackbar(message: e.toString());
    }
  }

  Future updateProfile() async {
    var updatedProfile = await _navigationService.navigateTo(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(
        profileInfo: profileInfo,
      ),
    );
    if (updatedProfile != null) {
      profileInfo = updatedProfile;
      notifyListeners();
    }
  }
}
