import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/indivisual_create_file_payload.dart';
import 'package:huayati/models/personal_data.dart';

import 'api.dart';

class IndividualService {
  final _api = locator<Api>();

  Future<bool> getIndividualUploadState() async {
    try {
      await _api.getCallWithToken(url: '/api/Individual/IndividualUploadState');
      return false;
    } on DioError catch (e) {
      print(e);
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<PersonalData> getPersonalData() async {
    try {
      final parsed = await _api.getCallWithToken(
        url: '/api/Individual/GetPersonalData',
      );
      return PersonalData.fromJson(parsed);
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createFiles(IndivisualCreateFilePayload payload) async {
    try {
      await _api.putCallWithToken(
        url: '/api/Individual/CreateFiles',
        data: payload,
      );
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
