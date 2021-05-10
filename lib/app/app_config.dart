import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final Widget child;
  final bool isDevEnviroment;
  final String authEndpoint;
  final String endpoint;

  AppConfig({
    @required this.child,
    @required this.appTitle,
    @required this.buildFlavor,
    @required this.isDevEnviroment,
    @required this.authEndpoint,
    @required this.endpoint,
  });

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
