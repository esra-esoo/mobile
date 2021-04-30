import 'package:huayati/app/locator.dart';
import 'package:huayati/enums/group_file_type.dart';
import 'package:huayati/models/company/authorizer_form.dart';
import 'package:huayati/models/company/company_form.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class CompanyFormViewModel extends IndexTrackingViewModel {
  final _snackbarService = locator<SnackbarService>();

  CompanyForm companyForm = CompanyForm.initial();

  List<AuthorizerForm> _authorizers = [];
  List<AuthorizerForm> get authorizers => _authorizers;

  void initilizeView() {}

  void addAuthorizer() {
    _authorizers.add(
      AuthorizerForm(
        passport: null,
        groupFile: null,
        groupFileType: null,
      ),
    );
    notifyListeners();
  }

  void removeAuthorizer(int index) {
    _authorizers.removeAt(index);
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

  void onAuthorizerExtraTypeChanged(int authorizerIndex, int value) {
    _authorizers[authorizerIndex].groupFileType = GroupFileType.values[value];
  }
}
