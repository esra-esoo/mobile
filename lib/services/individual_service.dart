import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';

import 'api.dart';

class IndividualService {
  final _api = locator<Api>();

  Future<bool> getIndividualUploadState() async {
    try {
      await _api.getCallWithToken(url: '/api/Individual/IndividualUploadState');
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
