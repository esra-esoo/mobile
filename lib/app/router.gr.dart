// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/company/create_files/create_files_view.dart';
import '../ui/views/company_data/company_data_view.dart';
import '../ui/views/individual/bank_account/bank_account_view.dart';
import '../ui/views/individual/create_files/create_files_view.dart';
import '../ui/views/individual/personal_data/personal_data_view.dart';
import '../ui/views/individual/update_files/update_files_view.dart';
import '../ui/views/otp/otp_view.dart';
import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String companyCreateFilesView = '/company-create-files-view';
  static const String companyDataView = '/company-data-view';
  static const String individualCreateFilesView =
      '/individual-create-files-view';
  static const String individualUpdateFilesView =
      '/individual-update-files-view';
  static const String individualPersonalDataView =
      '/individual-personal-data-view';
  static const String individualBankAccountDataView =
      '/individual-bank-account-data-view';
  static const String startUpView = '/start-up-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String otpView = '/otp-view';
  static const all = <String>{
    splashScreenView,
    companyCreateFilesView,
    companyDataView,
    individualCreateFilesView,
    individualUpdateFilesView,
    individualPersonalDataView,
    individualBankAccountDataView,
    startUpView,
    signInView,
    signUpView,
    otpView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.companyCreateFilesView, page: CompanyCreateFilesView),
    RouteDef(Routes.companyDataView, page: CompanyDataView),
    RouteDef(Routes.individualCreateFilesView, page: IndividualCreateFilesView),
    RouteDef(Routes.individualUpdateFilesView, page: IndividualUpdateFilesView),
    RouteDef(Routes.individualPersonalDataView,
        page: IndividualPersonalDataView),
    RouteDef(Routes.individualBankAccountDataView,
        page: IndividualBankAccountDataView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.otpView, page: OtpView),
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
    IndividualBankAccountDataView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const IndividualBankAccountDataView(),
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
