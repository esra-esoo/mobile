import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final Widget child;
  final bool isDevEnviroment;

  AppConfig({
    @required this.child,
    @required this.appTitle,
    @required this.buildFlavor,
    @required this.isDevEnviroment,
  });

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
