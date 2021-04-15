import 'package:flutter/material.dart';

class WhiteLogo extends StatelessWidget {
  final double height;
  final double width;
  const WhiteLogo({Key key, @required this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_white.png',
      fit: BoxFit.contain,
      height: height,
      width: width ?? double.infinity,
    );
  }
}
