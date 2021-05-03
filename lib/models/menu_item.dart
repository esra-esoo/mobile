import 'package:flutter/material.dart';

class MenuItem {
  String title;
  String route;
  int notifciation;

  MenuItem({
    @required this.title,
    this.route,
    this.notifciation = 0,
  });
}
