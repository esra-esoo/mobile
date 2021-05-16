import 'package:huayati/services/push_notification_service.dart';
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
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: const [
    const AdaptiveRoute(page: SplashScreenView, initial: true),
    const AdaptiveRoute(page: CompanyCreateFilesView),
    const AdaptiveRoute(page: CompanyDataView),
    const AdaptiveRoute(page: CompanyBankAccountsDataView),
    const AdaptiveRoute(page: CompanyUpdateFilesView),
    const AdaptiveRoute(page: RepresentativeUpdateFilesView),
    const AdaptiveRoute(page: RepresentativeDataView),
    const AdaptiveRoute(page: IndividualCreateFilesView),
    const AdaptiveRoute(page: IndividualUpdateFilesView),
    const AdaptiveRoute(page: IndividualPersonalDataView),
    const AdaptiveRoute(page: IndividualBankAccountsDataView),
    const CustomRoute(
      page: StartUpView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500,
    ),
    const CustomRoute(
      page: SignInView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    const CustomRoute(
      page: SignUpView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    const AdaptiveRoute(page: OtpView, fullscreenDialog: true),
    const AdaptiveRoute(page: ForgetPasswordView, fullscreenDialog: true),
    const AdaptiveRoute(page: EditProfileView, fullscreenDialog: true),
    const AdaptiveRoute(page: ChangePasswordView, fullscreenDialog: true),
  ],
  dependencies: [
    const LazySingleton(classType: Api),
    const LazySingleton(classType: NavigationService),
    const LazySingleton(classType: DialogService),
    const LazySingleton(classType: SnackBarsService),
    const LazySingleton(classType: SecureStorageService),
    const LazySingleton(classType: PickerService),
    const LazySingleton(classType: UserService),
    const LazySingleton(classType: AuthService),
    const LazySingleton(classType: IndividualService),
    const LazySingleton(classType: CompanyService),
    const LazySingleton(classType: SharedService),
    const LazySingleton(classType: PushNotificationService),
    const LazySingleton(classType: StartUpViewModel),
    const Singleton(classType: ProfileViewModel),
  ],
)
class AppSetup {}
