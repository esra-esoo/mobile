import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FormTitle extends StatelessWidget {
  final String title;
  const FormTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
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
