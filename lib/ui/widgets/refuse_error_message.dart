import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RefuseFilesErrorMessage extends StatelessWidget {
  final String errorMessage;
  const RefuseFilesErrorMessage(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return errorMessage != null
        ? Text(
          errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 16,
              tablet: 18,
            ),
          ),
        )
        : SizedBox.shrink();
  }
}
