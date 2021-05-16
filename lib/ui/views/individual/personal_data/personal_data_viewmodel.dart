import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/individual/personal_data.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:stacked/stacked.dart';

class IndividualPersonalDataViewModel extends BaseViewModel {
  final IndividualService _individualService = locator<IndividualService>();

  PersonalData? personalData;
  Future initilizeView() async {
    try {
      personalData = await runBusyFuture(
        _individualService.getPersonalData(),
        throwException: true,
      );
    } catch (e) {
      print(e);
    }
  }
}
