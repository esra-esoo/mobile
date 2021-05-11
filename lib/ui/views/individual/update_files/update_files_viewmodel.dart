import 'dart:async';
import 'dart:io';

import 'package:huayati/models/individual/image_file.dart';
import 'package:huayati/models/individual/image_raw_file.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/ui/widgets/success_update_modal.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/extensions/file_extensions.dart';

class IndividualUpdateFilesViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedService = locator<SharedService>();

  List<IndivisualImageFile> imageFiles = [];
  List<IndivisualImageRawFile> newImageFiles = [];
  String refuseMessage;
  bool hasError = false;

  File getNewRawImageFileById(String individualFileId) {
    var index = newImageFiles.indexWhere(
      (element) => element.individualFileId == individualFileId,
    );
    if (index == -1)
      return null;
    else
      return newImageFiles[index].file;
  }

  void addToNewImageFiles(IndivisualImageFile imageFile, File file) {
    var index = newImageFiles.indexWhere(
      (element) => element.individualFileId == imageFile.individualFileId,
    );
    if (index == -1) {
      newImageFiles.add(
        IndivisualImageRawFile(
          individualFileId: imageFile.individualFileId,
          name: imageFile.name,
          file: file,
          isEditDisabled: imageFile.isEditDisabled,
          fileFullName: file.getName,
          editBtnShow: imageFile.editBtnShow,
        ),
      );
    } else {
      newImageFiles[index] = IndivisualImageRawFile(
        individualFileId: imageFile.individualFileId,
        name: imageFile.name,
        file: file,
        isEditDisabled: imageFile.isEditDisabled,
        fileFullName: file.getName,
        editBtnShow: imageFile.editBtnShow,
      );
    }
    notifyListeners();
  }

  void initilizeView() async {
    try {
      hasError =
          _sharedService?.sharedRefuseState?.indivisualRefuseState != null;
      refuseMessage =
          _sharedService?.sharedRefuseState?.indivisualRefuseState?.message;
      imageFiles = await runBusyFuture(
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

  Future saveData() async {
    if (newImageFiles.length != imageFiles.length) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك إعادة رفع كافة المستندات المشار إليهم باللون الاحمر',
      );
      return;
    }
    var response = await _dialogService.showConfirmDialog(
      title: 'تأكيد العملية',
      description: 'هل أنت متأكد من رغبتك في حفظ التغييرات؟',
    );
    if (!response.confirmed) return;
    await _uploadFiles();
  }

  Future _uploadFiles() async {
    try {
      setBusy(true);
      var updatedImages = await _getUpdatedImageFiles();
      await _individualService.changeAllImages(updatedImages);
      await _sharedService.getRefuseState();
      setBusy(false);
      await _showSuccessModal();
    } catch (e) {
      setBusy(false);
      print(e);
      _snackbarService.showBottomErrorSnackbar(
        message: e.toString(),
      );
    }
  }

  Future<List<IndivisualImageFile>> _getUpdatedImageFiles() async {
    List<IndivisualImageFile> list = [];
    for (var updatedImages in newImageFiles) {
      var base64Content = await FileUtils.fromRawFileToBase64String(
        updatedImages.file,
      );
      list.add(IndivisualImageFile(
        individualFileId: updatedImages.individualFileId,
        name: updatedImages.name,
        base64Content: base64Content,
        editBtnShow: updatedImages.editBtnShow,
        isEditDisabled: updatedImages.isEditDisabled,
        fileFullName: updatedImages.fileFullName,
      ));
    }
    return list;
  }

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
