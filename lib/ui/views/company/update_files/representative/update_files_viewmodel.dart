import 'dart:async';
import 'dart:io';

import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/models/representative/image_file.dart';
import 'package:huayati/models/representative/image_raw_file.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/shared_service.dart';

import 'package:stacked_services/stacked_services.dart' ;
import 'package:huayati/ui/widgets/success_update_modal.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/extensions/file_extensions.dart';

class RepresentativeUpdateFilesViewModel extends BaseViewModel {
  final _companyService = locator<CompanyService>();
  final _snackbarService = locator<SnackBarsService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedService = locator<SharedService>();

  List<RepresentativeImageFile> imageFiles = [];
  List<RepresentativeImageRawFile> newImageFiles = [];
  String refuseMessage;

  File getNewRawImageFileById(String representativeFileId) {
    var index = newImageFiles.indexWhere(
      (element) => element.representativeFileId == representativeFileId,
    );
    if (index == -1)
      return null;
    else
      return newImageFiles[index].file;
  }

  void addToNewImageFiles(
    RepresentativeImageFile imageFile,
    File file,
  ) {
    var index = newImageFiles.indexWhere(
      (element) =>
          element.representativeFileId == imageFile.representativeFileId,
    );
    if (index == -1) {
      newImageFiles.add(
        RepresentativeImageRawFile(
          representativeFileId: imageFile.representativeFileId,
          representativeId: imageFile.representativeId,
          name: imageFile.name,
          file: file,
          isEditDisabled: imageFile.isEditDisabled,
          fileFullName: file.getName,
          editBtnShow: imageFile.editBtnShow,
          isFirst: imageFile.isFirst,
        ),
      );
    } else {
      newImageFiles[index] = RepresentativeImageRawFile(
        representativeFileId: imageFile.representativeFileId,
        representativeId: imageFile.representativeId,
        name: imageFile.name,
        file: file,
        isEditDisabled: imageFile.isEditDisabled,
        fileFullName: file.getName,
        editBtnShow: imageFile.editBtnShow,
        isFirst: imageFile.isFirst,
      );
    }
    notifyListeners();
  }

  void initilizeView() async {
    try {
      refuseMessage = _sharedService
          ?.sharedRefuseState?.companyRefuseState?.representativeMessage;
      imageFiles = await runBusyFuture(
        _companyService.getRepresentativeImages(),
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
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
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
      await _companyService.changeRepresentativeImage(updatedImages);
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

  Future<List<RepresentativeImageFile>> _getUpdatedImageFiles() async {
    List<RepresentativeImageFile> list = [];
    for (var updatedImages in newImageFiles) {
      var base64Content = await FileUtils.fromRawFileToBase64String(
        updatedImages.file,
      );
      list.add(RepresentativeImageFile(
        representativeFileId: updatedImages.representativeFileId,
        representativeId: updatedImages.representativeId,
        name: updatedImages.name,
        base64Content: base64Content,
        editBtnShow: updatedImages.editBtnShow,
        isEditDisabled: updatedImages.isEditDisabled,
        fileFullName: updatedImages.fileFullName,
        isFirst: updatedImages.isFirst,
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
