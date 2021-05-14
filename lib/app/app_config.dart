import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final Widget child;
  final bool isDevEnviroment;
  final String authEndpoint;
  final String endpoint;

  AppConfig(
    this.child, {
    required this.appTitle,
    required this.buildFlavor,
    required this.isDevEnviroment,
    required this.authEndpoint,
    required this.endpoint,
  }) : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
