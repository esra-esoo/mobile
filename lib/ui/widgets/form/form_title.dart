import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final Color color;
  const FormTitle({
    Key? key,
    required this.title,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: getValueForScreenType<double>(
          context: context,
          mobile: 20,
          tablet: 30,
        ),
      ),
    );
  }
}
