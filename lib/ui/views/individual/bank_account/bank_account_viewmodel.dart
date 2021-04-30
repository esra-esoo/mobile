import 'package:huayati/app/locator.dart';
import 'package:huayati/models/individual/bank_account_data.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:stacked/stacked.dart';

class IndividualBankAccountDataViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();
  final _navigationService = locator<NavigationService>();

  List<BankAccountData> bankAccountData = [];
  Future initilizeView() async {
    try {
      bankAccountData = await runBusyFuture(
        _individualService.getBankAccounts(),
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
