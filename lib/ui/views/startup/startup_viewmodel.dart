import 'package:stacked/stacked.dart';


class StartUpViewModel extends IndexTrackingViewModel {
  // final _localizationService = locator<LocalizationService>();
  // final _pushNotificationService = locator<PushNotificationService>();
  // final _analyticsService = locator<AnalyticsService>();
  // final _userService = locator<UserService>();

  Future<void> initializeView() async {
    // final isLoggedIn = await _userService.isLoggedIn();
    // if (isLoggedIn) await _analyticsService.logUserId();
    // await _analyticsService.logLanguage(
    //   langCode: _localizationService.currentLanguageCode,
    // );
    // await Future.delayed(const Duration(seconds: 2));
    // await _pushNotificationService.initialise();
  }
}
