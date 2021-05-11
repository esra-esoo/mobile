import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huayati/consts/pass_sent_by.dart';
import 'package:huayati/consts/styles.dart';
import 'package:image_picker/image_picker.dart';

class PickerItem {
  final String label;
  final dynamic value;
  PickerItem({@required this.label, @required this.value});
}

class PickerService {
  Future<ImageSource> showMediaType() async {
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
                    TextButton.icon(
                      style: kmediaPickerFlatButtonPrimaryStyle,
                      icon: Icon(Icons.camera, color: Colors.white),
                      label: Text(
                        'كاميرا',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                    ),
                    TextButton.icon(
                      style: kmediaPickerFlatButtonPrimaryStyle,
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

  Future<int> showResetMethod() async {
    await HapticFeedback.mediumImpact();
    return await showPlatformModalSheet(
        material: MaterialModalSheetData(
          enableDrag: true,
          backgroundColor: Colors.transparent,
        ),
        context: Get.overlayContext,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Material(
                  child: Text(
                    'إستعادة بإستعمال',
                    style: TextStyle(
                      color: kcolorPrimaryBlue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      style: kmediaPickerFlatButtonAccentStyle,
                      onPressed: () => Navigator.pop(context, SentByValue.SMS),
                      icon: Icon(Icons.phone_android, color: kcolorPrimaryBlue),
                      label: Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          color: kcolorPrimaryBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      style: kmediaPickerFlatButtonAccentStyle,
                      onPressed: () =>
                          Navigator.pop(context, SentByValue.EMAIL),
                      icon:
                          Icon(Icons.email_outlined, color: kcolorPrimaryBlue),
                      label: Text(
                        'البريد',
                        style: TextStyle(
                          color: kcolorPrimaryBlue,
                          fontSize: 16.sp,
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
