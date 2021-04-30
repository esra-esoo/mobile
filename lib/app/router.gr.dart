// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/company_data/company_data_view.dart';
import '../ui/views/company_form/company_form_view.dart';
import '../ui/views/indivisual/create_files/create_files_view.dart';
import '../ui/views/otp/otp_view.dart';
import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String companyFormView = '/company-form-view';
  static const String companyDataView = '/company-data-view';
  static const String individualCreateFilesView =
      '/individual-create-files-view';
  static const String startUpView = '/start-up-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String otpView = '/otp-view';
  static const all = <String>{
    splashScreenView,
    companyFormView,
    companyDataView,
    individualCreateFilesView,
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
    RouteDef(Routes.companyFormView, page: CompanyFormView),
    RouteDef(Routes.companyDataView, page: CompanyDataView),
    RouteDef(Routes.individualCreateFilesView, page: IndividualCreateFilesView),
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
    CompanyFormView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyFormView(),
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
