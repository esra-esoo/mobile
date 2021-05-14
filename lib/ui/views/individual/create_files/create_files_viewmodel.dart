import 'package:huayati/consts/documents_names.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/models/file_models.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/shared_service.dart';

import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/enums/group_file_type.dart';
import 'package:huayati/models/individual/individual_form.dart';
import 'package:huayati/models/individual/indivisual_create_files_payload.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/widgets/success_upload_modal.dart';
import 'package:stacked_services/stacked_services.dart' ;

class IndividualCreateFilesViewModel extends BaseViewModel {
  final IndividualService? _individualService = locator<IndividualService>();
  final SnackBarsService _snackbarService = locator<SnackBarsService>();
  final SharedService _sharedService = locator<SharedService>();
  final UserService _userService = locator<UserService>();
  final DialogService _dialogService = locator<DialogService>();

  IndividualForm individualForm = IndividualForm.initial();

  void onExtraTypeChanged(int value) {
    individualForm.groupFileType = GroupFileType.values[value];
  }

  void onExtraType2Changed(int value) {
    individualForm.groupFileType2 = GroupFileType2.values[value];
  }

  Future saveData() async {
    if (individualForm.passport == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة جواز السفر',
      );
      return;
    } else if (individualForm.groupFile == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة الرقم الوطني أو شهادة الميلاد',
      );
      return;
    } else if (individualForm.groupFile2 == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة من كشف الحساب أو الصك',
      );
      return;
    }
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.confirm,
      title: 'تأكيد العملية',
      description: 'هل أنت متأكد من رغبتك في حفظ التغييرات؟',
    );
    if (response == null || !response.confirmed) return;
    await _uploadFiles();
  }

  Future _uploadFiles() async {
    try {
      setBusy(true);
      var user = await _userService.loadUser();
      var fileModels = await _getFileModels();
      await _individualService!.createFiles(
        IndivisualCreateFilesPayload(
          phoneNumber: user.phoneNumber,
          filesModels: fileModels,
          length: FileUtils.getFilesTotalLength(fileModels),
        ),
      );
      await _userService.update(
        User(
          phoneNumber: user.phoneNumber,
          customerType: user.customerType,
          hasUploaded: true,
          sub: user.sub,
        ),
      );
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

  Future<List<FilesModels>> _getFileModels() async {
    return [
      await FileUtils.fromRawFileToFileModel(
        DocumentsNames.PASSPORT,
        individualForm.passport!,
      ),
      await FileUtils.fromRawFileToFileModel(
        individualForm.groupFileType == GroupFileType.nid
            ? DocumentsNames.NID
            : DocumentsNames.BIRTH_CERTIFICATE,
        individualForm.groupFile!,
      ),
      await FileUtils.fromRawFileToFileModel(
        individualForm.groupFileType2 == GroupFileType2.account_statement
            ? DocumentsNames.ACCOUNT_STATEMENT
            : DocumentsNames.CHEQUE,
        individualForm.groupFile2!,
      ),
    ];
  }

  Future _showSuccessModal() async {
    await showGeneralDialog(
      context: Get.overlayContext!,
      barrierColor: Colors.white,
      barrierDismissible: false,
      barrierLabel: "success dialog",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => SuccessUploadModal(),
    );
  }
}
