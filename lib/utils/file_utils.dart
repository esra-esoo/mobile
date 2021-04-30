import 'dart:convert';
import 'dart:io';
import 'package:huayati/models/indivisual_create_file_payload.dart';
import 'package:huayati/extensions/file_extensions.dart';

class FileUtils {
  static Future<FilesModels> fromRawFileToFileModel(
    String fileName,
    File file,
  ) async {
    List<int> imageBytes = await file.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    int fileLength = await file.length();

    return FilesModels(
      name: fileName,
      fileBytes: base64Image,
      fileFullName: file.getName,
      length: fileLength,
    );
  }

  static int getFilesTotalLength(List<FilesModels> filesModel) {
    return filesModel.fold<int>(0, (x, y) => x + y.length);
  }
}
