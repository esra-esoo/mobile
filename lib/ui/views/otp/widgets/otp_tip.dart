import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OtpTip extends StatelessWidget {
  const OtpTip();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ستصلك رسالة تحتوي على رمز التحقق، ادخله لاتمام عملية انشاء الحساب',
      style: TextStyle(
        color: Colors.white,
        fontSize: getValueForScreenType<double>(
          context: context,
          mobile: 16,
          tablet: 18,
        ),
      ),
    );
  }
}
