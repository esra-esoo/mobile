import 'dart:async';
import 'dart:io';

import 'package:huayati/models/company/image_file.dart';
import 'package:huayati/models/company/image_raw_file.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/ui/widgets/success_update_modal.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/extensions/file_extensions.dart';

class CompanyUpdateFilesViewModel extends BaseViewModel {
  final _companyService = locator<CompanyService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedService = locator<SharedService>();

  List<CompanyImageFile> imageFiles = [];
  List<CompanyImageRawFile> newImageFiles = [];
  String refuseMessage;

  File getNewRawImageFileById(String companyFileId) {
    var index = newImageFiles.indexWhere(
      (element) => element.companyFileId == companyFileId,
    );
    if (index == -1)
      return null;
    else
      return newImageFiles[index].file;
  }

  Future addToNewImageFiles(CompanyImageFile imageFile, File file) async {
    var index = newImageFiles.indexWhere(
      (element) => element.companyFileId == imageFile.companyFileId,
    );
    if (index == -1) {
      newImageFiles.add(
        CompanyImageRawFile(
          companyFileId: imageFile.companyFileId,
          name: imageFile.name,
          file: file,
          isEditDisabled: imageFile.isEditDisabled,
          fileFullName: file.getName,
          editBtnShow: imageFile.editBtnShow,
        ),
      );
    } else {
      newImageFiles[index] = CompanyImageRawFile(
        companyFileId: imageFile.companyFileId,
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
      refuseMessage =
          _sharedService?.sharedRefuseState?.companyRefuseState?.message;
      imageFiles = await runBusyFuture(
        _companyService.getCompanyImages(),
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
        message: 'يجب عليك إعادة رفع كافة المستندات',
      );
      return;
    }
    var response = await _dialogService.showConfirmDialog(
      title: 'تأكيد العملية',
      description: 'هل أنت متأكد من رغبتك في حفظ التغييرات ؟',
    );
    if (!response.confirmed) return;
    await _uploadFiles();
  }

  Future _uploadFiles() async {
    try {
      setBusy(true);
      var updatedImages = await _getUpdatedImageFiles();
      await _companyService.changeCompanyImages(updatedImages);
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

  Future<List<CompanyImageFile>> _getUpdatedImageFiles() async {
    List<CompanyImageFile> list = [];
    for (var updatedImages in newImageFiles) {
      var base64Content = await FileUtils.fromRawFileToBase64String(
        updatedImages.file,
      );
      list.add(CompanyImageFile(
        companyFileId: updatedImages.companyFileId,
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