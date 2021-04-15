import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JbankLogo extends StatelessWidget {
  const JbankLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/jbank_logo.png',
      fit: BoxFit.contain,
      width: 120.w,
    );
  }
}
