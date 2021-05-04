import 'package:huayati/app/locator.dart';
import 'package:huayati/models/company/bank_account.dart';
import 'package:huayati/models/navigation_result.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:stacked/stacked.dart';

class CompanyBankAccountsDataViewModel extends BaseViewModel {
  final _companyService = locator<CompanyService>();
  final _navigationService = locator<NavigationService>();

  List<CompanyBankAccount> companyBankAccounts = [];
  Future initilizeView() async {
    try {
      companyBankAccounts = await runBusyFuture(
        _companyService.getBankAccounts(),
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
