// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/profile_info.dart';
import '../ui/views/change_password/change_password_view.dart';
import '../ui/views/company/bank_account/bank_account_view.dart';
import '../ui/views/company/company_data/company_data_view.dart';
import '../ui/views/company/create_files/create_files_view.dart';
import '../ui/views/company/representative_data/representative_data_view.dart';
import '../ui/views/company/update_files/company/update_files_view.dart';
import '../ui/views/company/update_files/representative/update_files_view.dart';
import '../ui/views/individual/bank_accounts/bank_accounts_view.dart';
import '../ui/views/individual/create_files/create_files_view.dart';
import '../ui/views/individual/personal_data/personal_data_view.dart';
import '../ui/views/individual/update_files/update_files_view.dart';
import '../ui/views/otp/otp_view.dart';
import '../ui/views/profile/edit_form/edit_profile_view.dart';
import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String companyCreateFilesView = '/company-create-files-view';
  static const String companyDataView = '/company-data-view';
  static const String companyBankAccountsDataView =
      '/company-bank-accounts-data-view';
  static const String companyUpdateFilesView = '/company-update-files-view';
  static const String representativeUpdateFilesView =
      '/representative-update-files-view';
  static const String representativeDataView = '/representative-data-view';
  static const String individualCreateFilesView =
      '/individual-create-files-view';
  static const String individualUpdateFilesView =
      '/individual-update-files-view';
  static const String individualPersonalDataView =
      '/individual-personal-data-view';
  static const String individualBankAccountsDataView =
      '/individual-bank-accounts-data-view';
  static const String startUpView = '/start-up-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String otpView = '/otp-view';
  static const String editProfileView = '/edit-profile-view';
  static const String changePasswordView = '/change-password-view';
  static const all = <String>{
    splashScreenView,
    companyCreateFilesView,
    companyDataView,
    companyBankAccountsDataView,
    companyUpdateFilesView,
    representativeUpdateFilesView,
    representativeDataView,
    individualCreateFilesView,
    individualUpdateFilesView,
    individualPersonalDataView,
    individualBankAccountsDataView,
    startUpView,
    signInView,
    signUpView,
    otpView,
    editProfileView,
    changePasswordView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.companyCreateFilesView, page: CompanyCreateFilesView),
    RouteDef(Routes.companyDataView, page: CompanyDataView),
    RouteDef(Routes.companyBankAccountsDataView,
        page: CompanyBankAccountsDataView),
    RouteDef(Routes.companyUpdateFilesView, page: CompanyUpdateFilesView),
    RouteDef(Routes.representativeUpdateFilesView,
        page: RepresentativeUpdateFilesView),
    RouteDef(Routes.representativeDataView, page: RepresentativeDataView),
    RouteDef(Routes.individualCreateFilesView, page: IndividualCreateFilesView),
    RouteDef(Routes.individualUpdateFilesView, page: IndividualUpdateFilesView),
    RouteDef(Routes.individualPersonalDataView,
        page: IndividualPersonalDataView),
    RouteDef(Routes.individualBankAccountsDataView,
        page: IndividualBankAccountsDataView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.otpView, page: OtpView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.changePasswordView, page: ChangePasswordView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreenView(),
        settings: data,
      );
    },
    CompanyCreateFilesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyCreateFilesView(),
        settings: data,
      );
    },
    CompanyDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyDataView(),
        settings: data,
      );
    },
    CompanyBankAccountsDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyBankAccountsDataView(),
        settings: data,
      );
    },
    CompanyUpdateFilesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyUpdateFilesView(),
        settings: data,
      );
    },
    RepresentativeUpdateFilesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RepresentativeUpdateFilesView(),
        settings: data,
      );
    },
    RepresentativeDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RepresentativeDataView(),
        settings: data,
      );
    },
    IndividualCreateFilesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const IndividualCreateFilesView(),
        settings: data,
      );
    },
    IndividualUpdateFilesView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const IndividualUpdateFilesView(),
        settings: data,
      );
    },
    IndividualPersonalDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const IndividualPersonalDataView(),
        settings: data,
      );
    },
    IndividualBankAccountsDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const IndividualBankAccountsDataView(),
        settings: data,
      );
    },
    StartUpView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => StartUpView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      );
    },
    SignInView: (data) {
      final args = data.getArgs<SignInViewArguments>(
        orElse: () => SignInViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SignInView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignUpView(key: args.key),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    OtpView: (data) {
      final args = data.getArgs<OtpViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OtpView(
          key: args.key,
          phoneNumber: args.phoneNumber,
          email: args.email,
          customerType: args.customerType,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    EditProfileView: (data) {
      final args = data.getArgs<EditProfileViewArguments>(
        orElse: () => EditProfileViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => EditProfileView(
          key: args.key,
          profileInfo: args.profileInfo,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ChangePasswordView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ChangePasswordView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignInView arguments holder class
class SignInViewArguments {
  final Key key;
  final String phoneNumber;
  SignInViewArguments({this.key, this.phoneNumber});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key key;
  SignUpViewArguments({this.key});
}

/// OtpView arguments holder class
class OtpViewArguments {
  final Key key;
  final String phoneNumber;
  final String email;
  final int customerType;
  OtpViewArguments(
      {this.key,
      @required this.phoneNumber,
      this.email,
      @required this.customerType});
}

/// EditProfileView arguments holder class
class EditProfileViewArguments {
  final Key key;
  final ProfileInfo profileInfo;
  EditProfileViewArguments({this.key, this.profileInfo});
}
