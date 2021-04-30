import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/image_file.dart';
import 'package:huayati/models/individual/bank_account_data.dart';
import 'package:huayati/models/individual/indivisual_create_file_payload.dart';
import 'package:huayati/models/individual/personal_data.dart';

import 'api.dart';

class IndividualService {
  final _api = locator<Api>();

  Future<bool> getUploadState() async {
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

  Future<List<ImageFile>> getImages() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetImages',
      );
      return response
          ?.map<ImageFile>(
            (json) => ImageFile.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<PersonalData> getPersonalData() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetPersonalData',
      );
      return PersonalData.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<BankAccountData> getBankAccounts() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetBankAccounts',
      );
      return BankAccountData.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
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
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> changeAllImages(List<ImageFile> images) async {
    try {
      await _api.putCallWithToken(
        url: '/api/Individual/ChangeAllImages',
        data: images,
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }
}
