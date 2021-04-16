import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomSubmitButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isBusy;
  const BottomSubmitButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.isBusy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: kcolorBluelight,
      color: Colors.white,
      minWidth: double.infinity,
      child: SafeArea(
        minimum: EdgeInsets.only(
          top: getValueForScreenType<double>(
              context: context, mobile: 20, tablet: 30),
          bottom: getValueForScreenType<double>(
              context: context, mobile: 20, tablet: 30),
        ),
        bottom: true,
        child: isBusy
            ? SizedBox(
                height: 31,
                width: 31,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: kcolorPrimaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
      onPressed: onPressed,
    );
  }
}
