import 'package:dio/dio.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/models/individual/image_file.dart';
import 'package:huayati/models/individual/bank_account.dart';
import 'package:huayati/models/individual/indivisual_create_files_payload.dart';
import 'package:huayati/models/individual/personal_data.dart';

import 'api.dart';

class IndividualService {
  final _api = locator<Api>();

  Future<List<IndivisualImageFile>> getImages() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetImages',
      );
      return response
          ?.map<IndivisualImageFile>(
            (json) => IndivisualImageFile.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> changeAllImages(List<IndivisualImageFile> images) async {
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

  Future<List<IndivisualBankAccount>> getBankAccounts() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Individual/GetBankAccounts',
      );
      return response
          ?.map<IndivisualBankAccount>(
            (json) => IndivisualBankAccount.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createFiles(IndivisualCreateFilesPayload payload) async {
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
}
