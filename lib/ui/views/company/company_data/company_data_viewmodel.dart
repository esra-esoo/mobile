import 'package:huayati/app/locator.dart';
import 'package:huayati/models/company/company_data.dart';
import 'package:huayati/services/company_service.dart';
import 'package:stacked/stacked.dart';

class CompanyDataViewModel extends BaseViewModel {
  final _companyService = locator<CompanyService>();

  CompanyData companyData;

  Future<void> initilizeView() async {
    try {
      companyData = await runBusyFuture(
        _companyService.getCompanyData(),
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
