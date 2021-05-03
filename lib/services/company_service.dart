import 'package:dio/dio.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/company/company_create_files_payload.dart';
import 'package:huayati/models/image_file.dart';

import 'api.dart';

class CompanyService {
  final _api = locator<Api>();

  Future<List<ImageFile>> getImages() async {
    try {
      final response = await _api.getCallWithToken(
        url: '/api/Company/GetImages',
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
}
