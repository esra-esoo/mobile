// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/signin/signin_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String startUpView = '/start-up-view';
  static const String signInView = '/sign-in-view';
  static const String signUpView = '/sign-up-view';
  static const all = <String>{
    splashScreenView,
    startUpView,
    signInView,
    signUpView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.signUpView, page: SignUpView),
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
