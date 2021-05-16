import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/app/app_config.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/company/refuse_state.dart';
import 'package:huayati/models/individual/refuse_state.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';

import 'third_party/secure_storage_service.dart';

class PushNotificationService {
  final _fcm = FirebaseMessaging.instance;

  final _snackbarService = locator<SnackBarsService>();
  final _sharedService = locator<SharedService>();
  final _secureStorageService = locator<SecureStorageService>();

  Future<void> initialize() async {
    try {
      if (Platform.isIOS) {
        await Future.delayed(const Duration(seconds: 2));
        await _fcm.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
      }
      var alreadySubscribed = await _secureStorageService.readBoolean(
        StorageKeys.SUBSCRIBED,
      );
      if (!alreadySubscribed) await _subscribeToDefaultTopic();

      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) => _handleForgroundMessages(message),
      );

      FirebaseMessaging.onMessageOpenedApp.listen(
        (RemoteMessage message) => _handleBackgroundMessages(message),
      );

      await _handleTerminatedBackgroundMessages();
    } catch (e) {
      print('notification service initialise error => $e');
    }
  }

  Future<String?> getDeviceToken() async {
    final token = await _fcm.getToken();
    print('FCM Token => $token');
    return token;
  }

  Future _subscribeToDefaultTopic() async {
    final isDevEnviroment = AppConfig.of(Get.context!)!.isDevEnviroment;

    isDevEnviroment
        ? await _fcm.subscribeToTopic('dev_all_users')
        : await _fcm.subscribeToTopic('all_users');

    await _secureStorageService.addBoolean(StorageKeys.SUBSCRIBED, true);
    print('subscriber to ' +
        (isDevEnviroment ? 'dev_all_users' : 'all_users') +
        ' topic');
  }

  Future unSubscribeFromDefaultTopic() async {
    final isDevEnviroment = AppConfig.of(Get.context!)!.isDevEnviroment;

    isDevEnviroment
        ? await _fcm.unsubscribeFromTopic('dev_all_users')
        : await _fcm.unsubscribeFromTopic('all_users');

    await _secureStorageService.addBoolean(StorageKeys.SUBSCRIBED, false);
    print('unsubscriber from ' +
        (isDevEnviroment ? 'dev_all_users' : 'all_users') +
        ' topic');
  }

  Future<void> _handleForgroundMessages(RemoteMessage message) async {
    print('handleForgroundMessages');
    if (message.notification?.title != null &&
        message.notification?.body != null) {
      _snackbarService.showNotificationSnackbar(
        title: message.notification!.title!,
        message: message.notification!.body!,
      );
    }
    _updateAccountRefuseStateFromMessage(message);
  }

  Future<void> _handleBackgroundMessages(RemoteMessage message) async {
    print('handleBackgroundMessages');
    _updateAccountRefuseStateFromMessage(message);
  }

  Future<void> _handleTerminatedBackgroundMessages() async {
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      print('handleTerminatedBackgroundMessages');
      _updateAccountRefuseStateFromMessage(initialMessage);
    }
  }

  void _updateAccountRefuseStateFromMessage(RemoteMessage message) {
    try {
      if (message.data['refuse_state'] != null) {
        String? accountType = message.data['account_type'];
        var parsedJson = jsonDecode(message.data['refuse_state']);
        if (parsedJson == null) return;
        if (accountType == 'company') {
          CompanyRefuseState? companyRefuseState =
              CompanyRefuseState.fromJson(parsedJson);
          _sharedService.updateCompanyState(companyRefuseState);
        } else if (accountType == 'indivisual') {
          IndivisualRefuseState? indivisualRefuseState =
              IndivisualRefuseState.fromJson(parsedJson);
          _sharedService.updateIndivisualState(indivisualRefuseState);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
