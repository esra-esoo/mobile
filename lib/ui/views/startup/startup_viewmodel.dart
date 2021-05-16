import 'package:huayati/app/app.locator.dart';
import 'package:huayati/services/push_notification_service.dart';
import 'package:stacked/stacked.dart';

class StartUpViewModel extends IndexTrackingViewModel {
  final _pushNotificationService = locator<PushNotificationService>();

  Future<void> initializeView() async {
    await Future.delayed(const Duration(seconds: 2));
    await _pushNotificationService.initialize();
  }
}
