import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/company/bank_account.dart';
import 'package:huayati/services/company_service.dart';
import 'package:stacked/stacked.dart';

class CompanyBankAccountsDataViewModel extends BaseViewModel {
  final CompanyService _companyService = locator<CompanyService>();

  List<CompanyBankAccount>? companyBankAccounts = [];
  Future initilizeView() async {
    try {
      companyBankAccounts = await runBusyFuture(
        _companyService.getBankAccounts(),
        throwException: true,
      );
    } catch (e) {
      print(e);
    }
  }
}
