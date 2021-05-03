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
    //TODO validation
    bool isValid = true;
    if (isValid)
      setIndex(1);
    else
      _snackbarService.showBottomErrorSnackbar(
        message: 'جميع المستندات مطلوبة !',
      );
  }

  Future saveData() async {}

  void onRepresentativeExtraTypeChanged(int index, int value) {
    _representatives[index].groupFileType = GroupFileType.values[value];
  }
}
