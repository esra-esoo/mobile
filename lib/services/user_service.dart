import 'dart:async';
import 'dart:convert';

import 'package:huayati/app/app.locator.dart';
import 'package:huayati/consts/storage_keys.dart';
import 'package:huayati/models/user.dart';

import 'third_party/secure_storage_service.dart';

class UserService {
  final _storage = locator<SecureStorageService>();
  final _userController = StreamController<User>();

  Stream<User> get userStream => _userController.stream;

  Future<void> addUser(User user) async {
    await _storage.addString(StorageKeys.USER, jsonEncode(user));
    _userController.sink.add(user);
    print('user has been added : ${user.toJson()}');
  }

  Future<void> update(User updatedUser) async {
    await _storage.addString(StorageKeys.USER, jsonEncode(updatedUser));
    _userController.sink.add(updatedUser);
    print('user has been updated : ${updatedUser.toJson()}');
  }

  Future<User> loadUser() async {
    try {
      final userString = await _storage.readString(StorageKeys.USER);
      if (userString == null) {
        _userController.sink.add(User.initial());
        return User.initial();
      } else {
        final user = User.fromJson(jsonDecode(userString));
        _userController.sink.add(user);
        return user;
      }
    } catch (e) {
      print(e);
      _userController.sink.add(User.initial());
      return User.initial();
    }
  }

  Future<void> clearUser() async {
    await _storage.deleteAll();
    _userController.sink.add(User.initial());
  }

  void dispose() {
    _userController.close();
  }
}
