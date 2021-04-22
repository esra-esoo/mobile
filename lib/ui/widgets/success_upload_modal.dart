import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/app/router.gr.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/services/third_party/navigation_service.dart';
import 'package:huayati/ui/animations/fade_animation.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SuccessUploadModal extends StatelessWidget {
  const SuccessUploadModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FadeAnimation(
                child: Icon(
                  Icons.check_circle,
                  color: kcolorPrimaryBlue,
                  size: getValueForScreenType<double>(
                    context: context,
                    mobile: 80,
                    tablet: 100,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                'تمت عملية رفع المستندات بنجاح',
                style: TextStyle(
                  color: kcolorPrimaryBlue,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 18,
                    tablet: 20,
                  ),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'سيتم ارسال رسالة نصية الي رقم الهاتف تحتوي علي رقم الطلب فور انتهاء من معالجة البيانات.',
                style: TextStyle(
                  color: kcolorPrimaryBlue,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 16,
                    tablet: 18,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                '* بعد اسستلام الرسالة النصية التي تحتوي على رقم الطلب الرجاء التوجه الي فرعكم لإستكمال الاجراء مصحوبا بالمستندات الاثصلية التي تم رفعها.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 14,
                    tablet: 16,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '* في حالة تم رفض المستندات سوف تصلك رسالة تحتوي على سبب الرفض عندها ستوجب عليك إعادة رفع المستندات المرفوضة.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 14,
                    tablet: 16,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              RaisedButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                splashColor: kcolorBluelight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                color: kcolorPrimaryBlue,
                child: Text(
                  'الرئيسية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getValueForScreenType<double>(
                      context: context,
                      mobile: 16,
                      tablet: 18,
                    ),
                  ),
                ),
                textColor: kcolorPrimaryBlue,
                onPressed: () => locator<NavigationService>()
                    .pushNamedAndRemoveUntil(Routes.startUpView),
              ),
              const BottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
