import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:huayati/ui/views/company/bank_account/bank_account_view.dart';
import 'package:huayati/ui/views/company/company_data/company_data_view.dart';
import 'package:huayati/ui/views/company/create_files/create_files_view.dart';
import 'package:huayati/ui/views/company/update_files/update_files_view.dart';
import 'package:huayati/ui/views/individual/bank_accounts/bank_accounts_view.dart';
import 'package:huayati/ui/views/individual/create_files/create_files_view.dart';
import 'package:huayati/ui/views/individual/personal_data/personal_data_view.dart';
import 'package:huayati/ui/views/individual/update_files/update_files_view.dart';
import 'package:huayati/ui/views/otp/otp_view.dart';
import 'package:huayati/ui/views/signin/signin_view.dart';
import 'package:huayati/ui/views/signup/signup_view.dart';
import 'package:huayati/ui/views/splash_screen/splash_screen_view.dart';
import 'package:huayati/ui/views/startup/startup_view.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: SplashScreenView, initial: true),
  AdaptiveRoute(page: CompanyCreateFilesView),
  AdaptiveRoute(page: CompanyDataView),
  AdaptiveRoute(page: CompanyBankAccountsDataView),
  AdaptiveRoute(page: CompanyUpdateFilesView),
  AdaptiveRoute(page: IndividualCreateFilesView),
  AdaptiveRoute(page: IndividualUpdateFilesView),
  AdaptiveRoute(page: IndividualPersonalDataView),
  AdaptiveRoute(page: IndividualBankAccountsDataView),
  CustomRoute(
    page: StartUpView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 500,
  ),
  CustomRoute(
    page: SignInView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: SignUpView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  AdaptiveRoute(page: OtpView, fullscreenDialog: true),
])
class $Router {}
