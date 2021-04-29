import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  Future<void> initializeView() async {
    var user = await _userService.loadUser();
    var userLoggedIn = user.role != null;

    await Future.delayed(
      const Duration(seconds: 2),
      () {
        return _navigationService.pushNamedAndRemoveUntil(
          userLoggedIn ? Routes.startUpView : Routes.signInView,
        );
      },
    );
  }
}
