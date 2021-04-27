import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OtpTip extends StatelessWidget {
  final String phoneNo;
  const OtpTip({@required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return Text(
      'ستصلك رسالة تحتوي على رمز التحقق على الرقم $phoneNo، ادخله لاتمام عملية انشاء الحساب',
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
