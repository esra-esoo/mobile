import 'package:huayati/app/locator.dart';
import 'package:huayati/enums/extra_file_type.dart';
import 'package:huayati/models/individual_form.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class IndividualFormViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();

  IndividualForm individualForm = IndividualForm.initial();

  void initilizeView() {}

  Future saveData() async {}

  void onExtraTypeChanged(int value) {
    individualForm.extraFileType = ExtraFileType.values[value];
  }
}
