import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextFieldLabel extends StatelessWidget {
  final String label;
  const TextFieldLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: getValueForScreenType<double>(
          context: context,
          mobile: 16,
          tablet: 18,
        ),
      ),
    );
  }
}
