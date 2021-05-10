import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huayati/consts/styles.dart';
import 'package:image_picker/image_picker.dart';

class ResetMethodPickerService {
  Future<int> showBottomSheet() async {
    await HapticFeedback.mediumImpact();
    return await showPlatformModalSheet(
        material: MaterialModalSheetData(
          enableDrag: true,
          backgroundColor: Colors.transparent,
        ),
        context: Get.overlayContext,
        builder: (context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: kcolorPrimaryBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      splashColor: kcolorBluelight,
                      minWidth: 150.w,
                      height: 90.h,
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                      icon: Icon(Icons.camera, color: Colors.white),
                      label: Text(
                        'كاميرا',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      minWidth: 150.w,
                      height: 90.h,
                      splashColor: kcolorBluelight,
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.gallery),
                      icon: Icon(Icons.image, color: Colors.white),
                      label: Text(
                        'الصور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        });
  }
}
