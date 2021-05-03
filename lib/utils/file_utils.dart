import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:huayati/models/file_models.dart';
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

  static Future<String> fromRawFileToBase64String(File file) async {
    try {
      List<int> imageBytes = await file.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static int getFilesTotalLength(List<FilesModels> filesModel) {
    return filesModel.fold<int>(0, (x, y) => x + y.length);
  }

  static Uint8List base64ToBytes(String base64String) {
    try {
      var bytes = base64Decode(base64String.split(',')[1]);
      return bytes;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
