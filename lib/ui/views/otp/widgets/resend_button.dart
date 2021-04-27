import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResendButton extends StatelessWidget {
  final Function onTap;
  const ResendButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'لم يصلك رمز التحقق ؟',
          style: TextStyle(
            color: Colors.white,
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 14,
              tablet: 15,
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: onTap,
          child: Text(
            'إعاة إسال',
            style: TextStyle(
              color: onTap != null ? Colors.white : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
