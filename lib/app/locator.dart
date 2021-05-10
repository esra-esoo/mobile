import 'package:get_it/get_it.dart';
import 'package:huayati/services/api.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/dialog_service.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/services/third_party/picker_services.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/views/profile/profile_viewmodel.dart';
import 'package:huayati/ui/views/startup/startup_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //////////////////////////////////////////////////////////////////////////
  //##Services
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => PickerService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => IndividualService());
  locator.registerLazySingleton(() => CompanyService());
  locator.registerLazySingleton(() => SharedService());

  //////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton(() => StartUpViewModel());
  locator.registerSingleton(ProfileViewModel());
}
