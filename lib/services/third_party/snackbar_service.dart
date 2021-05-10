import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/consts/styles.dart';

class SnackBarsService {
  /// Shows a snack bar with the details passed in
  void showTopSuccessSnackbar({
    @required String message,
    Duration duration = const Duration(seconds: 4),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: Colors.grey.shade800,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showBottomSuccessSnackbar({
    @required String message,
    Duration duration = const Duration(seconds: 4),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: Colors.grey.shade800,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showTopErrorSnackbar({
    @required String message,
    Duration duration = const Duration(seconds: 3),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: Colors.red.shade700,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showTopInfoSnackbar({
    @required String message,
    Duration duration = const Duration(seconds: 3),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: kcolorPrimaryBlue,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showBottomErrorSnackbar({
    @required String message,
    Duration duration = const Duration(seconds: 3),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: Colors.red.shade700,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showWarningSnackbar({
    String title = 'تنبيه !',
    @required String message,
    Duration duration = const Duration(seconds: 4),
    Function onTap,
    IconData iconData,
    bool shouldIconPulse = false,
  }) {
    GetBar(
      title: title,
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      backgroundColor: Colors.orange.shade600,
      // animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showNotificationSnackbar({
    @required String title,
    @required String message,
    Duration duration = const Duration(seconds: 4),
    Function onTap,
    IconData iconData,
  }) {
    GetBar(
      title: title,
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      isDismissible: true,
      icon: const Icon(Icons.notifications_active, color: Colors.white),
      backgroundColor: kcolorPrimaryBlue,
      animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }

  void showNormalSnack({
    @required String message,
    Duration duration = const Duration(seconds: 2),
    Function onTap,
    IconData iconData,
  }) {
    GetBar(
      messageText: Text(
        message,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      duration: duration,
      isDismissible: true,
      animationDuration: const Duration(seconds: 1),
      padding: const EdgeInsets.all(20),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 15,
      margin: const EdgeInsets.all(10),
      onTap: onTap,
    ).show();
  }
}
