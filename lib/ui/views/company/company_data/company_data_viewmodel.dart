import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/company/company_data.dart';
import 'package:huayati/services/company_service.dart';
import 'package:stacked/stacked.dart';

class CompanyDataViewModel extends BaseViewModel {
  final CompanyService _companyService = locator<CompanyService>();

  CompanyData? companyData;

  Future<void> initilizeView() async {
    try {
      companyData = await runBusyFuture(
        _companyService.getCompanyData(),
        throwException: true,
      );
    } catch (e) {
      print(e);
    }
  }
}
