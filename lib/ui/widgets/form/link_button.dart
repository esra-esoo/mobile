import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LinkButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final MainAxisAlignment mainAxisAlignment;

  final bool bold;
  const LinkButton({
    Key key,
    @required this.onTap,
    @required this.label,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: getValueForScreenType<double>(
                context: context,
                mobile: 18,
                tablet: 20,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
