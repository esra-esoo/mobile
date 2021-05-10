// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/individual_service.dart';
import '../services/shared_service.dart';
import '../services/third_party/picker_services.dart';
import '../services/third_party/secure_storage_service.dart';
import '../services/third_party/snackbar_service.dart';
import '../services/user_service.dart';
import '../ui/views/profile/profile_viewmodel.dart';
import '../ui/views/startup/startup_viewmodel.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackBarsService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => PickerService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => IndividualService());
  locator.registerLazySingleton(() => CompanyService());
  locator.registerLazySingleton(() => SharedService());
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerSingleton(ProfileViewModel());
}
