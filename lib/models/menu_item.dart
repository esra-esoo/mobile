import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  final int notifciation;

  const MenuItem({
    @required this.title,
    this.route,
    this.notifciation = 0,
  });
}
