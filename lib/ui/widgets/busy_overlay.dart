import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:huayati/consts/styles.dart';

class BusyOverlay extends StatelessWidget {
  final Widget child;
  final bool show;
  final bool primaryColors;

  const BusyOverlay({
    this.child,
    this.show = false,
    this.primaryColors = false,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          child,
          AbsorbPointer(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 375),
              opacity: show ? 1.0 : 0.0,
              child: Container(
                width: show ? screenSize.width : 0.0,
                height: show ? screenSize.height : 0.0,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.2),
                child: SizedBox(
                  height: 200.w,
                  width: 200.w,
                  child: show
                      ? SpinKitFoldingCube(
                          color:
                              primaryColors ? kcolorPrimaryBlue : Colors.white,
                          size: 100.w,
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
