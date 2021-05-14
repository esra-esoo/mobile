// @dart=2.9

import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/ui/views/change_password/change_password_view.dart';
import 'package:huayati/ui/views/company/bank_account/bank_account_view.dart';
import 'package:huayati/ui/views/company/company_data/company_data_view.dart';
import 'package:huayati/ui/views/company/create_files/create_files_view.dart';
import 'package:huayati/ui/views/company/representative_data/representative_data_view.dart';
import 'package:huayati/ui/views/company/update_files/company/update_files_view.dart';
import 'package:huayati/ui/views/company/update_files/representative/update_files_view.dart';
import 'package:huayati/ui/views/forget_password/forget_password_view.dart';
import 'package:huayati/ui/views/individual/bank_accounts/bank_accounts_view.dart';
import 'package:huayati/ui/views/individual/create_files/create_files_view.dart';
import 'package:huayati/ui/views/individual/personal_data/personal_data_view.dart';
import 'package:huayati/ui/views/individual/update_files/update_files_view.dart';
import 'package:huayati/ui/views/otp/otp_view.dart';
import 'package:huayati/ui/views/profile/edit_form/edit_profile_view.dart';
import 'package:huayati/ui/views/signin/signin_view.dart';
import 'package:huayati/ui/views/signup/signup_view.dart';
import 'package:huayati/ui/views/splash_screen/splash_screen_view.dart';
import 'package:huayati/ui/views/startup/startup_view.dart';
import 'package:huayati/services/api.dart';
import 'package:huayati/services/auth_service.dart';
import 'package:huayati/services/company_service.dart';
import 'package:huayati/services/individual_service.dart';
import 'package:huayati/services/shared_service.dart';
import 'package:huayati/services/third_party/picker_services.dart';
import 'package:huayati/services/third_party/secure_storage_service.dart';
import 'package:huayati/services/user_service.dart';
import 'package:huayati/ui/views/profile/profile_viewmodel.dart';
import 'package:huayati/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: CompanyCreateFilesView),
    MaterialRoute(page: CompanyDataView),
    MaterialRoute(page: CompanyBankAccountsDataView),
    MaterialRoute(page: CompanyUpdateFilesView),
    MaterialRoute(page: RepresentativeUpdateFilesView),
    MaterialRoute(page: RepresentativeDataView),
    MaterialRoute(page: IndividualCreateFilesView),
    MaterialRoute(page: IndividualUpdateFilesView),
    MaterialRoute(page: IndividualPersonalDataView),
    MaterialRoute(page: IndividualBankAccountsDataView),
    CustomRoute(
      page: StartUpView,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      page: SignInView,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: SignUpView,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(page: OtpView, fullscreenDialog: true),
    MaterialRoute(page: ForgetPasswordView, fullscreenDialog: true),
    MaterialRoute(page: EditProfileView, fullscreenDialog: true),
    MaterialRoute(page: ChangePasswordView, fullscreenDialog: true),
  ],
  dependencies: [
    LazySingleton(classType: Api),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackBarsService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: PickerService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: IndividualService),
    LazySingleton(classType: CompanyService),
    LazySingleton(classType: SharedService),
    LazySingleton(classType: StartUpViewModel),
    Singleton(classType: ProfileViewModel),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
