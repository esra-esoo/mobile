import 'dart:io';

import 'package:huayati/app/locator.dart';
import 'package:huayati/enums/authorizer_extra_file_type.dart';
import 'package:huayati/models/authorizer.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class CompanyViewModel extends IndexTrackingViewModel {
  final _snackbarService = locator<SnackbarService>();

  File file1;
  File file2;
  File file3;
  File file4;
  File file5;
  List<Authorizer> _authorizers = [];
  List<Authorizer> get authorizers => _authorizers;

  void initilizeView() {}

  void addAuthorizer() {
    _authorizers.add(
      Authorizer(
        passport: null,
        extraFile: null,
        extraFileType: null,
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
    _authorizers[authorizerIndex].extraFileType =
        AutorizerExtraFileType.values[value];
  }
}
