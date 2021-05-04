import 'package:huayati/app/locator.dart';
import 'package:huayati/enums/group_file_type.dart';
import 'package:huayati/models/company/representative_form.dart';
import 'package:huayati/models/company/company_form.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class CompanyCreateFilesViewModel extends IndexTrackingViewModel {
  final _snackbarService = locator<SnackbarService>();

  CompanyForm companyForm = CompanyForm.initial();

  List<RepresentativeForm> _representatives = [];
  List<RepresentativeForm> get representatives => _representatives;

  void initilizeView() {}

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

  Future saveData() async {}
}
