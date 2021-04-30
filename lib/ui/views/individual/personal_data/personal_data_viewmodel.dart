import 'package:huayati/app/locator.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/models/personal_data.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:stacked/stacked.dart';

class IndividualPersonalDataViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();
  final _navigationService = locator<NavigationService>();

  PersonalData personalData;
  Future initilizeView() async {
    try {
      personalData = await runBusyFuture(
        _individualService.getPersonalData(),
        throwException: true,
      );
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      _navigationService.back(
        result: NavigationResult(
          success: false,
          message: e.toString(),
        ),
      );
    }
  }
}
