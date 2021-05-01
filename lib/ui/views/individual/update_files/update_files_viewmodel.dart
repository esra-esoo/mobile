import 'dart:convert';

import 'package:huayati/models/image_file.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/ui/widgets/success_update_modal.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/services/user_service.dart';

class IndividualUpdateFilesViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  List<ImageFile> _imageFiles = [];
  List<ImageFile> get imageFiles => _imageFiles;
  String refuseMessage;
  
  void initilizeView() async {
    try {
      _imageFiles = await runBusyFuture(
        _individualService.getImages(),
        throwException: true,
      );
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      _navigationService.back(
        result: NavigationResult(
          success: false,
          message: e.toString(),
        ),
      );
    }
  }

  Future saveData() async {}

  Future _showSuccessModal() async {
    await showGeneralDialog(
      context: Get.overlayContext,
      barrierColor: Colors.white,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => SuccessUpdateModal(),
    );
  }
}
