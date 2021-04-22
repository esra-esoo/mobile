// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/company_form/company_form_view.dart';
import '../ui/views/otp/otp_view.dart';
import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String companyView = '/company-view';
  static const String startUpView = '/start-up-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const String otpView = '/otp-view';
  static const all = <String>{
    splashScreenView,
    companyView,
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
    RouteDef(Routes.companyView, page: CompanyView),
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
    CompanyView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CompanyView(),
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
        pageBuilder: (context, animation, secondaryAnimation) =>
            SignInView(key: args.key),
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
      final args = data.getArgs<OtpViewArguments>(
        orElse: () => OtpViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OtpView(
          key: args.key,
          userId: args.userId,
          resendCode: args.resendCode,
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
  SignInViewArguments({this.key});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key key;
  SignUpViewArguments({this.key});
}

/// OtpView arguments holder class
class OtpViewArguments {
  final Key key;
  final String userId;
  final bool resendCode;
  OtpViewArguments({this.key, this.userId, this.resendCode});
}
