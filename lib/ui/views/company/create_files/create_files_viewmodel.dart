import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/consts/documents_names.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:huayati/enums/group_file_type.dart';
import 'package:huayati/models/company/company_create_files_payload.dart';
import 'package:huayati/models/company/company_employee_model.dart';
import 'package:huayati/models/company/representative_form.dart';
import 'package:huayati/models/company/company_form.dart';
import 'package:huayati/models/file_models.dart';
import 'package:huayati/models/user.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/shared_service.dart';

import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/widgets/success_upload_modal.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;

class CompanyCreateFilesViewModel extends IndexTrackingViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _sharedService = locator<SharedService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();
  final _companyService = locator<CompanyService>();

  CompanyForm companyForm = CompanyForm.initial();

  List<RepresentativeForm> _representatives = [];
  List<RepresentativeForm> get representatives => _representatives;

  void addRepresentative() {
    _representatives.add(
      RepresentativeForm(
        passport: null,
        groupFile: null,
        groupFileType: null,
      ),
    );
    notifyListeners();
  }

  void removeRepresentative(int index) {
    _representatives.removeAt(index);
    notifyListeners();
  }

  void goNext() {
    if (companyForm.commercialLicense == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة الرخصة التجارية',
      );
      return;
    } else if (companyForm.commercialRegister == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة السجل التجاري',
      );
      return;
    } else if (companyForm.importersRecord == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة سجل المستوردين',
      );
      return;
    } else if (companyForm.chamberOfCommerce == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة الغرفة التجارية',
      );
      return;
    } else if (companyForm.groupFile2 == null) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك تحميل صورة من كشف الحساب أو الصك',
      );
      return;
    }
    setIndex(1);
  }

  void onExtraType2Changed(int value) {
    companyForm.groupFileType2 = GroupFileType2.values[value];
  }

  void onRepresentativeExtraTypeChanged(int index, int value) {
    _representatives[index].groupFileType = GroupFileType.values[value];
  }

  Future saveData() async {
    if (_representatives.length == 0) {
      _snackbarService.showBottomErrorSnackbar(
        message: 'يجب عليك إضافة مخول واحد على الأقل',
      );
      return;
    } else
      for (var i = 0; i < _representatives.length; i++) {
        if (_representatives[i].passport == null) {
          _snackbarService.showBottomErrorSnackbar(
            message: 'يجب عليك تحميل صورة جواز السفر للمخول رقم ${i + 1}',
          );
          return;
        } else if (_representatives[i].groupFile == null) {
          _snackbarService.showBottomErrorSnackbar(
            message:
                'يجب عليك تحميل صورة الرقم الوطني أو شهادة الميلاد للمخول رقم ${i + 1}',
          );
          return;
        }
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
      User user = await _userService.loadUser();
      List<FilesModels> companyFilesModel = await _getCompanyFilesModel();
      List<CompanyEmployeeModel> companyEmployeeModel =
          await _getCompanyEmployeeModel(user);

      await _companyService.createFiles(
        CompanyCreateFilesPayload(
          phoneNumber: user.phoneNumber,
          companyFilesModel: companyFilesModel,
          companyEmployeeModel: companyEmployeeModel,
          totalFilesLength: FileUtils.getFilesTotalLength(companyFilesModel),
        ),
      );

      await _userService.update(User(
        phoneNumber: user.phoneNumber,
        customerType: user.customerType,
        hasUploaded: true,
        sub: user.sub,
      ));
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

  Future<List<FilesModels>> _getCompanyFilesModel() async {
    return [
      await FileUtils.fromRawFileToFileModel(
        DocumentsNames.COMMERCIAL_LICENSE,
        companyForm.commercialLicense,
      ),
      await FileUtils.fromRawFileToFileModel(
        DocumentsNames.COMMERCIAL_REGISTER,
        companyForm.commercialRegister,
      ),
      await FileUtils.fromRawFileToFileModel(
        DocumentsNames.IMPORTERS_RECORD,
        companyForm.importersRecord,
      ),
      await FileUtils.fromRawFileToFileModel(
        DocumentsNames.CHAMBER_OF_COMMERCE,
        companyForm.chamberOfCommerce,
      ),
      await FileUtils.fromRawFileToFileModel(
        companyForm.groupFileType2 == GroupFileType2.account_statement
            ? DocumentsNames.ACCOUNT_STATEMENT
            : DocumentsNames.CHEQUE,
        companyForm.groupFile2,
      ),
    ];
  }

  Future<List<CompanyEmployeeModel>> _getCompanyEmployeeModel(User user) async {
    List<CompanyEmployeeModel> modelList = [];

    for (var i = 0; i < _representatives.length; i++) {
      RepresentativeForm representative = _representatives[i];
      List<FilesModels> companyEmployeeFilesModel = [
        await FileUtils.fromRawFileToFileModel(
          DocumentsNames.REPRESENTATIVE_PASSPORT,
          representative.passport,
        ),
        await FileUtils.fromRawFileToFileModel(
          representative.groupFileType == GroupFileType.nid
              ? DocumentsNames.REPRESENTATIVE_NID
              : DocumentsNames.REPRESENTATIVE_BIRTH_CERTIFICATE,
          representative.groupFile,
        ),
      ];
      modelList.add(CompanyEmployeeModel(
        userId: user.sub,
        companyEmployeeFilesModel: companyEmployeeFilesModel,
        isFirstRepresentative: i == 0,
        totalFilesLength: companyEmployeeFilesModel.length,
      ));
    }
    return modelList;
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
