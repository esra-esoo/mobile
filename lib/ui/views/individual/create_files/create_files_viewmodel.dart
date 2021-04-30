import 'package:huayati/consts/documents_names.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/enums/group_file_type.dart';
import 'package:huayati/models/individual_form.dart';
import 'package:huayati/models/indivisual_create_file_payload.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/widgets/success_upload_modal.dart';

class IndividualCreateFilesViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();
  final _snackbarService = locator<SnackbarService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  IndividualForm individualForm = IndividualForm.initial();

  void initilizeView() {}

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
      var user = await _userService.loadUser();
      var filesModels = await _populateFilesModels();
      await _individualService.createFiles(
        IndivisualCreateFilePayload(
          phoneNumber: user.phoneNumbaer,
          filesModels: filesModels,
          length: FileUtils.getFilesTotalLength(filesModels),
        ),
      );
      await _userService.update(
        User(
          phoneNumbaer: user.phoneNumbaer,
          sub: user.sub,
          role: user.role,
          editMode: true,
        ),
      );
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

  Future<List<FilesModels>> _populateFilesModels() async {
    return [
      await FileUtils.fromRawFileToFileModel(
        'جواز السفر',
        individualForm.passport,
      ),
      await FileUtils.fromRawFileToFileModel(
        individualForm.groupFileType == GroupFileType.nid
            ? DocumentsNames.NID
            : DocumentsNames.BIRTH_CERTIFICATE,
        individualForm.groupFile,
      ),
      await FileUtils.fromRawFileToFileModel(
        individualForm.groupFileType2 == GroupFileType2.account_statement
            ? DocumentsNames.ACCOUNT_STATEMENT
            : DocumentsNames.CHEQUE,
        individualForm.groupFile2,
      ),
    ];
  }

  Future _showSuccessModal() async {
    await showGeneralDialog(
      context: Get.overlayContext,
      barrierColor: Colors.white,
      barrierDismissible: false,
      barrierLabel: "success dialog",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => SuccessUploadModal(),
    );
  }
}
