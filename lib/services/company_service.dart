import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';

import 'api.dart';

class CompanyService {
  final _api = locator<Api>();

  Future<bool> getCompanyUploadState() async {
    try {
      await _api.getCallWithToken(url: '/api/Company/CompanyUploadState');
      return true;
    } on DioError catch (e) {
      print(e);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
