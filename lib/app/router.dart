import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:huayati/ui/views/company_data/company_data_view.dart';
import 'package:huayati/ui/views/company_form/company_form_view.dart';
import 'package:huayati/ui/views/individual/bank_account/bank_account_view.dart';
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
  AdaptiveRoute(page: CompanyFormView),
  AdaptiveRoute(page: CompanyDataView),
  AdaptiveRoute(page: IndividualCreateFilesView),
  AdaptiveRoute(page: IndividualUpdateFilesView),
  AdaptiveRoute(page: IndividualPersonalDataView),
  AdaptiveRoute(page: IndividualBankAccountDataView),
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
