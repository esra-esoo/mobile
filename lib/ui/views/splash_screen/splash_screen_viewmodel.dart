import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _sharedService = locator<SharedService>();

  Future<void> initializeView() async {
    var user = await _userService.loadUser();
    print(user.toJson());
    var userLoggedIn = user?.customerType != null;

    if (userLoggedIn) {
      setBusy(true);
      await _sharedService.updateAccountInfo();
      await _sharedService.getRefuseState();
      _navigateToStartUp();
    } else {
      _navigateToSignIn();
    }
  }

  Future _navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.signInView,
    );
  }

  Future _navigateToStartUp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _navigationService.pushNamedAndRemoveUntil(
      Routes.startUpView,
    );
  }
}
