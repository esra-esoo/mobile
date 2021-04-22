import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FileSizeNote extends StatelessWidget {
  const FileSizeNote();

  @override
  Widget build(BuildContext context) {
    return Text(
      'حجم الصورة يجب ان يكون أقل من 2 ميجا',
      style: TextStyle(
        color: kcolorBluelight,
        fontSize: getValueForScreenType<double>(
          context: context,
          mobile: 16,
          tablet: 18,
        ),
      ),
    );
  }
}
