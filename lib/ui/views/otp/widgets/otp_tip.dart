import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OtpTip extends StatelessWidget {
  const OtpTip();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'ادخل رمز التفعيل الذي تم ارساله لهاتف, الرمز صالح لدقيقتين.',
        style: TextStyle(
          color: Colors.white,
          fontSize: getValueForScreenType<double>(
            context: context,
            mobile: 16,
            tablet: 18,
          ),
        ),
      ),
    );
  }
}
