import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/picker_services.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/home/home_viewmodel.dart';
import 'package:huayati/ui/views/startup/startup_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator({@required String endpoint}) {
  //////////////////////////////////////////////////////////////////////////
  //##Services
  // locator.registerLazySingleton(() => Api(endpoint));
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => PickerService());
  // locator.registerLazySingleton(() => UserService());
  // locator.registerLazySingleton(() => AuthService());

  //////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerSingleton(HomeViewModel());
}
