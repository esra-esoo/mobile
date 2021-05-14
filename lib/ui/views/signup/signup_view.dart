import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/link_button.dart';
import 'package:huayati/ui/widgets/full_logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_view.form.dart';
import 'signup_viewmodel.dart';
import 'widgets/account_type_radio.dart';

@FormView(fields: [
  FormTextField(name: 'phone'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: () => disposeForm(),
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () {
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
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
                            top: 30.h,
                            left: 30.w,
                            right: 30.w,
                          ),
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
                                maxLength: 10,
                                style: textFormFieldStyle,
                                decoration: kformFieldInputDecoration.copyWith(
                                  hintText: '09xxxxxxxx',
                                  labelText: 'رقم الهاتف (*)',
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormField(
                                cursorColor: kcolorPrimaryBlue,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                autocorrect: false,
                                style: textFormFieldStyle,
                                decoration: kformFieldInputDecoration.copyWith(
                                  hintText: 'ادخل عنوان البريد الالكتروني',
                                  labelText: 'البريد الالكتروني (اختياري)',
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Text(
                                'نوع المستخدم (*) :',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const AccountTypesRadio(),
                              SizedBox(height: 40.h),
                              LinkButton(
                                label: 'لدي حساب',
                                bold: true,
                                mainAxisAlignment: MainAxisAlignment.center,
                                onTap: () => viewModel.navigatoToSingInView(),
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
                label: 'إنشاء حساب',
                onPressed: () => viewModel.saveData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
