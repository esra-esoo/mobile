import 'package:flutter/material.dart';

class BottomPadding extends StatelessWidget {
  const BottomPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight +
          MediaQuery.of(context).viewPadding.bottom,
    );
  }
}
