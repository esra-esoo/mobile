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

@FormView(fields: [
  FormTextField(name: 'phone'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: () => disposeForm(),
      viewModelBuilder: () => SignUpViewModel(),
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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
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
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 30.h, left: 30.w, right: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // FormTitle(
                              //   title: 'تسجيل دخول',
                              // ),
                              // SizedBox(height: 30.h),

                              SizedBox(height: 40.h),

                              LinkButton(
                                label: 'لدي حساب',
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
