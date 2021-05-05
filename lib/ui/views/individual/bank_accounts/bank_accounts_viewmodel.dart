import 'package:huayati/app/locator.dart';
import 'package:huayati/models/individual/bank_account.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:stacked/stacked.dart';

class IndividualBankAccountsDataViewModel extends BaseViewModel {
  final _individualService = locator<IndividualService>();

  List<IndivisualBankAccount> indivisualBankAccount = [];
  Future initilizeView() async {
    try {
      indivisualBankAccount = await runBusyFuture(
        _individualService.getBankAccounts(),
        throwException: true,
      );
    } catch (e) {
      print(e);
      // await Future.delayed(const Duration(milliseconds: 500));
      // _navigationService.back(
      //   result: NavigationResult(
      //     success: false,
      //     message: e.toString(),
      //   ),
      // );
    }
  }
}
