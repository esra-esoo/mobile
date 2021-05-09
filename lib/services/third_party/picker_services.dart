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
  // Future<dynamic> showPlatformPickerModal({
  //   @required String messageTitle,
  //   @required List<PickerItem> items,
  //   PickerItem inititalValue,
  // }) async {
  //   var selectedItem = inititalValue;

  //   return await showPlatformModalSheet(
  //     androidIsScrollControlled: true,
  //     androidEnableDrag: true,
  //     androidBackgroundColor: Colors.transparent,
  //     context: Get.overlayContext,
  //     builder: (context) {
  //       return Container(
  //         constraints: BoxConstraints(
  //           maxHeight: MediaQuery.of(context).size.height * .9,
  //         ),
  //         decoration: BoxDecoration(
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(25),
  //             topRight: Radius.circular(25),
  //           ),
  //           color: Colors.white,
  //         ),
  //         child: Material(
  //           color: Colors.transparent,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               const SizedBox(height: 20),
  //               Text(
  //                 messageTitle,
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(height: 20),
  //               const Divider(
  //                 color: kcolorPrimaryBlue,
  //                 indent: 50,
  //                 endIndent: 50,
  //               ),
  //               Flexible(
  //                 child: Scrollbar(
  //                   child: ListView.builder(
  //                     shrinkWrap: true,
  //                     itemBuilder: (ctx, index) {
  //                       return RadioListTile<dynamic>(
  //                         activeColor: kcolorPrimaryBlue,
  //                         title: Text(items[index].label),
  //                         value: items[index]?.value,
  //                         groupValue: selectedItem?.value,
  //                         onChanged: (value) {
  //                           Navigator.pop(context, items[index].value);
  //                         },
  //                       );
  //                     },
  //                     itemCount: items.length,
  //                   ),
  //                 ),
  //               ),
  //               SafeArea(
  //                 bottom: true,
  //                 minimum: const EdgeInsets.only(top: 5, bottom: 5),
  //                 child: GestureDetector(
  //                   onTap: () => Navigator.pop(context, null),
  //                   child: Container(
  //                     decoration: ShapeDecoration(
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(30),
  //                       ),
  //                       color: kcolorPrimaryBlue,
  //                     ),
  //                     alignment: Alignment.center,
  //                     height: 50,
  //                     margin: const EdgeInsets.symmetric(
  //                       horizontal: 30,
  //                       vertical: 15,
  //                     ),
  //                     child: Text(
  //                       'تراجع',
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<ImageSource> showMediaType() async {
    await HapticFeedback.mediumImpact();
    return await showPlatformModalSheet(
        androidEnableDrag: true,
        androidBackgroundColor: Colors.transparent,
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

  Future<int> showResetMethod() async {
    await HapticFeedback.mediumImpact();
    return await showPlatformModalSheet(
        androidEnableDrag: true,
        androidBackgroundColor: Colors.transparent,
        context: Get.overlayContext,
        builder: (context) {
          return Container(
            height: 200,
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: kcolorPrimaryBlue,
                          width: 1,
                        ),
                      ),
                      splashColor: kcolorBluelight,
                      minWidth: 150.w,
                      height: 90.h,
                      onPressed: () => Navigator.pop(context, SentByValue.SMS),
                      icon: Icon(Icons.phone_android, color: kcolorPrimaryBlue),
                      label: Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          color: kcolorPrimaryBlue,
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
                          Navigator.pop(context, SentByValue.EMAIL),
                      icon:
                          Icon(Icons.email_outlined, color: kcolorPrimaryBlue),
                      label: Text(
                        'البريد',
                        style: TextStyle(
                          color: kcolorPrimaryBlue,
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
