import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/views/otp/widgets/otp_tip.dart';
import 'package:huayati/ui/views/otp/widgets/resend_button.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'forget_password_viewmodel.dart';
import 'package:huayati/extensions/string_extensions.dart';

class ForgetPasswordView extends StatefulWidget {
  final String phoneNumberOrEmail;
  final int sentBy;
  const ForgetPasswordView({
    Key key,
    @required this.phoneNumberOrEmail,
    @required this.sentBy,
  }) : super(key: key);

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _pinController = TextEditingController();
  final CountDownController _countDownController = CountDownController();
  bool _enableResend = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgetPasswordViewModel(),
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: BusyOverlay(
          show: viewModel.isBusy,
          child: Container(
            constraints: BoxConstraints.expand(),
            color: kcolorPrimaryBlue,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                brightness: Brightness.dark,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => viewModel.closeScreen(),
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                    ),
                    child: FormTitle(
                      title: 'طلب كلمة مرور جديدة',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                    ),
                    child: const OtpTip(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30.h,
                          left: 30.w,
                          right: 30.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularCountDownTimer(
                              duration: 120,
                              initialDuration: 0,
                              controller: _countDownController,
                              width: 100.w,
                              height: 100.w,
                              ringColor: Colors.grey[300],
                              ringGradient: null,
                              fillColor: kcolorBluelight,
                              fillGradient: null,
                              backgroundColor: Colors.white,
                              backgroundGradient: null,
                              strokeWidth: 20.w,
                              strokeCap: StrokeCap.butt,
                              textStyle: TextStyle(
                                fontSize: 22.sp,
                                color: kcolorBluelight,
                                fontWeight: FontWeight.bold,
                              ),
                              textFormat: CountdownTextFormat.MM_SS,
                              isReverse: true,
                              isReverseAnimation: true,
                              isTimerTextShown: true,
                              autoStart: true,
                              onComplete: () {
                                setState(() {
                                  _enableResend = true;
                                });
                              },
                            ),
                            SizedBox(height: 30.h),
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: PinCodeTextField(
                                  autoDismissKeyboard: true,
                                  errorTextSpace: 0,
                                  appContext: context,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  controller: _pinController,
                                  // autoDisposeControllers: false,
                                  length: 6,
                                  pastedTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  obscureText: false,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.circle,
                                    selectedColor: kcolorBluelight,
                                    selectedFillColor: kcolorBluelight,
                                    activeColor: kcolorBluelight,
                                    activeFillColor: kcolorBluelight,
                                    inactiveFillColor: Colors.white,
                                    inactiveColor: Colors.white,
                                    fieldWidth: 45.w,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  enableActiveFill: false,
                                  beforeTextPaste: (text) {
                                    if (text.length == 6)
                                      return true;
                                    else
                                      return false;
                                  },
                                  onCompleted: (_) => viewModel.verifyOtp(
                                    phoneNumberOrEmail:
                                        widget.phoneNumberOrEmail,
                                    sentBy: widget.sentBy,
                                    verificationCode:
                                        _pinController.text.toNumber,
                                  ),
                                  onSubmitted: (_) => {},
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            SizedBox(height: 50.h),
                            ResendButton(
                              onTap: _enableResend
                                  ? () async {
                                      var success = await viewModel.resendCode(
                                        phoneNumberOrEmail:
                                            widget.phoneNumberOrEmail,
                                        sentBy: widget.sentBy,
                                      );
                                      if (success) {
                                        _countDownController.restart();
                                        setState(() {
                                          _enableResend = false;
                                        });
                                      }
                                    }
                                  : null,
                            ),
                            const BottomPadding(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomSubmitButton(
                label: 'تحقق',
                onPressed: () => viewModel.verifyOtp(
                  phoneNumberOrEmail: widget.phoneNumberOrEmail,
                  sentBy: widget.sentBy,
                  verificationCode: _pinController.text.toNumber,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
