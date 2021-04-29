import 'package:huayati/enums/extra_file_type.dart';
import 'package:huayati/models/individual_form.dart';
import 'package:stacked/stacked.dart';

class IndividualFormViewModel extends BaseViewModel {

  IndividualForm individualForm = IndividualForm.initial();

  void initilizeView() {}

  Future saveData() async {}

  void onExtraTypeChanged(int value) {
    individualForm.extraFileType = ExtraFileType.values[value];
  }
}
