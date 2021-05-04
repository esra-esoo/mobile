import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/company/bank_account.dart';
import 'package:huayati/models/company/company_create_files_payload.dart';
import 'package:huayati/models/company/company_data.dart';
import 'package:huayati/models/company/image_file.dart';
import 'package:huayati/models/representative/image_file.dart';

import 'api.dart';

class CompanyService {
  final _api = locator<Api>();

  Future<void> createFiles(CompanyCreateFilesPayload payload) async {
    try {
      await _api.putCallWithToken(
        url: '/api/Company/CreateFiles',
        data: payload,
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<CompanyData> getCompanyData() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Company/GetCompanyData',
      );
      return CompanyData.fromJson(response);
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<List<CompanyBankAccount>> getBankAccounts() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Company/GetBankAccounts',
      );
      return response
          ?.map<CompanyBankAccount>(
            (json) => CompanyBankAccount.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<List<CompanyImageFile>> getCompanyImages() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Company/GetImages',
      );
      return response
          ?.map<CompanyImageFile>(
            (json) => CompanyImageFile.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> changeCompanyImages(List<CompanyImageFile> images) async {
    try {
      await _api.putCallWithToken(
        url: '/api/Company/ChangeImage',
        data: images,
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<List<RepresentativeImageFile>> getRepresentativeImages() async {
    try {
      final response = await _api.getCallWithToken(
        url: '',
      );
      return response
          ?.map<RepresentativeImageFile>(
            (json) => RepresentativeImageFile.fromJson(json),
          )
          ?.toList();
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }

  Future<void> changeRepresentativeImage(
      List<RepresentativeImageFile> images) async {
    try {
      await _api.putCallWithToken(
        url: '/api/Company/ChangeRepresentativeImage',
        data: images,
      );
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      throw e;
    }
  }
}
