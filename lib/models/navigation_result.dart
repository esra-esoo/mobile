import 'package:flutter/material.dart';

class NavigationResult {
  final bool success;
  final String message;
  final dynamic exta;

  const NavigationResult({
    @required this.success,
    this.message,
    this.exta,
  });
}
