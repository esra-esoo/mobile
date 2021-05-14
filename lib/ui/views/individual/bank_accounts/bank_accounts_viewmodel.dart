import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/individual/bank_account.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:stacked/stacked.dart';

class IndividualBankAccountsDataViewModel extends BaseViewModel {
  final IndividualService _individualService = locator<IndividualService>();

  List<IndivisualBankAccount>? indivisualBankAccount = [];
  Future initilizeView() async {
    try {
      indivisualBankAccount = await runBusyFuture(
        _individualService.getBankAccounts(),
        throwException: true,
      );
    } catch (e) {
      print(e);
    }
  }
}
