import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LinkButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Alignment alignment;
  const LinkButton({
    Key key,
    @required this.onTap,
    @required this.label,
    this.alignment = Alignment.centerRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        alignment: alignment,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 18,
              tablet: 20,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
