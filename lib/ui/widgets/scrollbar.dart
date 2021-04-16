import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScrollBar extends StatelessWidget {
  final Widget child;
  const PlatformScrollBar({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoScrollbar(
            child: child,
          )
        : Scrollbar(
            child: child,
          );
  }
}
