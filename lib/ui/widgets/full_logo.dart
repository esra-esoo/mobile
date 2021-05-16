import 'package:flutter/material.dart';

class FullLogo extends StatelessWidget {
  final double height;
  final double? width;
  const FullLogo({Key? key, required this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.contain,
      height: height,
      width: width ?? double.infinity,
    );
  }
}
