import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:huayati/extensions/string_extensions.dart';

class SecureStorageService {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  Future<bool> hasKey(String key) async {
    var value = await storage.read(key: key);
    return value != null;
  }

  Future<void> addString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String> readString(String key) async {
    return await storage.read(key: key);
  }

  Future<void> addNumber(String key, int value) async {
    await storage.write(key: key, value: value.toString());
  }

  Future<int> readNumber(String key) async {
    String value = await storage.read(key: key);
    return value?.toNumber;
  }

  Future<void> addDouble(String key, double value) async {
    await storage.write(key: key, value: value.toString());
  }

  Future<double> readDouble(String key) async {
    String value = await storage.read(key: key);
    return value?.toDouble;
  }

  Future<void> addBoolean(String key, bool value) async {
    await storage.write(key: key, value: value.toString());
  }

  Future<bool> readBoolean(String key) async {
    String value = await storage.read(key: key);
    return value != null && value == 'true';
  }
}
