import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomSubmitButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final bool isBusy;
  final bool accentColors;
  final bool disabled;
  const BottomSubmitButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.accentColors = true,
    this.isBusy = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      disabledColor: kColorCard,
      splashColor: kcolorBluelight,
      color: accentColors ? Colors.white : kcolorPrimaryBlue,
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
                  color: disabled
                      ? kColorText
                      : (accentColors ? kcolorPrimaryBlue : Colors.white),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
      onPressed: disabled ? null : onPressed,
    );
  }
}
