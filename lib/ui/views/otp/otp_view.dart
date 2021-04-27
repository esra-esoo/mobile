import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/signup_result.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/full_logo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'otp_viewmodel.dart';
import 'widgets/resend_button.dart';
import 'widgets/otp_tip.dart';
import 'package:huayati/extensions/string_extensions.dart';

class OtpView extends StatefulWidget {
  final SignUpResult signUpResult;
  const OtpView({
    Key key,
    @required this.signUpResult,
  }) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _pinController = TextEditingController();
  bool _enableResend = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
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
                children: [
                  Hero(
                    tag: 'logo',
                    child: FullLogo(
                      height: getValueForScreenType<double>(
                        context: context,
                        mobile: 150.h,
                        tablet: 90.h,
                      ),
                    ),
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
                            FormTitle(
                              title: 'رمز التحقق',
                            ),
                            SizedBox(height: 30.h),
                            OtpTip(phoneNo: widget.signUpResult.phoneNumber),
                            SizedBox(height: 30.h),
                            Padding(
                              padding: EdgeInsets.all(20.w),
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
                                onCompleted: (_) => viewModel.verifyUser(
                                  widget.signUpResult.phoneNumber,
                                  _pinController.text.toNumber,
                                ),
                                onSubmitted: (_) => {},
                                onChanged: (value) {},
                              ),
                            ),
                            SizedBox(height: 50.h),
                            ResendButton(
                              onTap: () => _enableResend
                                  ? viewModel.resendCode(
                                      widget.signUpResult.phoneNumber,
                                    )
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
                onPressed: () => viewModel.verifyUser(
                  widget.signUpResult.phoneNumber,
                  _pinController.text.toNumber,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
