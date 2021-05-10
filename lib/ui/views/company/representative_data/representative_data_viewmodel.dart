import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/representative/representative_data.dart';
import 'package:huayati/services/company_service.dart';
import 'package:stacked/stacked.dart';

class RepresentativeDataViewModel extends BaseViewModel {
  final _companyService = locator<CompanyService>();

  List<RepresentativeData> representativeDataList = [];

  Future<void> initilizeView() async {
    try {
      representativeDataList = await runBusyFuture(
        _companyService.getRepresentativeData(),
        throwException: true,
      );
    } catch (e) {
      print(e);
    }
  }
}
