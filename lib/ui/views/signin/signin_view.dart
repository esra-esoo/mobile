import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/link_button.dart';
import 'package:huayati/ui/widgets/form/password_field.dart';
import 'package:huayati/ui/widgets/full_logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin_view.form.dart';
import 'signin_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phone'),
  FormTextField(name: 'password'),
])
class SignInView extends StatelessWidget with $SignInView {
  SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: () => disposeForm(),
      viewModelBuilder: () => SignInViewModel(),
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
                leading: viewModel.canGoBack
                    ? IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      )
                    : const SizedBox.shrink(),
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
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, left: 30.w, right: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 30.h),
                              TextFormField(
                                cursorColor: kcolorPrimaryBlue,
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                autocorrect: false,
                                maxLength: 9,
                                style: textFormFieldStyle,
                                decoration: kformFieldInputDecoration.copyWith(
                                  hintText: '9xxxxxxxx',
                                  labelText: 'رقم الهاتف *',
                                ),
                              ),
                              SizedBox(height: 40.h),
                              PasswordFormField(
                                controller: passwordController,
                                onFieldSubmitted: (_) => viewModel.saveData(),
                              ),
                              SizedBox(height: 20.h),
                              LinkButton(
                                label: 'نسيت كلمة المرور ؟',
                                onTap: () => viewModel.recoverPassword(),
                              ),
                              SizedBox(height: 60.h),
                              // LinkButton(
                              //   label: 'سجلت ولم تصلني رسالة ؟',
                              //   onTap: () => viewModel.navigateToSignUpScreen(),
                              // ),
                              // SizedBox(height: 20.h),
                              LinkButton(
                                label: 'إنشاء حساب جديد',
                                bold: true,
                                onTap: () => viewModel.navigateToSignUpScreen(),
                              ),
                              const BottomPadding(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomSubmitButton(
                label: 'تسجيل دخول',
                onPressed: () => viewModel.saveData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
