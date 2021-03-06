import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> initializeView() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => _navigationService.pushNamedAndRemoveUntil(Routes.startUpView),
    );
  }
}
