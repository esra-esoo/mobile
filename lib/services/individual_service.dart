import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/indivisual_create_file_payload.dart';

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

  Future<void> createFiles(IndivisualCreateFilePayload payload) async {
    try {
      print(payload.toJson());
      return;
      await _api.putCallWithToken(
        url: '/api/Individual/CreateFiles',
        data: payload,
      );
      return true;
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
