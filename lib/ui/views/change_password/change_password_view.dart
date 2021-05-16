import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/form/password_field.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'change_password_view.form.dart';
import 'change_password_viewmodel.dart';

import 'package:huayati/extensions/string_extensions.dart';

@FormView(fields: [
  FormTextField(name: 'currentPassword'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class ChangePasswordView extends StatelessWidget with $ChangePasswordView {
  ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      onDispose: () => disposeForm(),
      viewModelBuilder: () => ChangePasswordViewModel(),
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () {
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
        },
        child: BusyOverlay(
          show: viewModel.isBusy,
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
                ),
                centerTitle: true,
                title: FormTitle(
                  title: 'تغيير كلمة المرور',
                  color: kcolorPrimaryBlue,
                ),
              ),
              body: Form(
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
                        TextFieldLabel(label: 'كلمة المرور الحالية'),
                        SizedBox(height: 10.h),
                        PasswordFormField(
                          textInputAction: TextInputAction.next,
                          controller: currentPasswordController,
                          inputDecoration:
                              kformFieldInputAccentDecoration.copyWith(
                            counterText: ' ',
                          ),
                          style: textFormFieldAccentStyle,
                          hintText: 'أدخل كلمة المرور الحالية ..',
                          labelText: 'كلمة المرور الحالية',
                          validator: (value) {
                            return value == null || value.isEmpty ? ' ' : null;
                          },
                        ),
                        const _PasswordHint(),
                        SizedBox(height: 20.h),
                        TextFieldLabel(label: 'كلمة المرور الجديدة'),
                        SizedBox(height: 10.h),
                        PasswordFormField(
                          textInputAction: TextInputAction.next,
                          controller: passwordController,
                          inputDecoration:
                              kformFieldInputAccentDecoration.copyWith(
                            counterText: ' ',
                          ),
                          style: textFormFieldAccentStyle,
                          hintText: 'أدخل كلمة المرور الجديدة ..',
                          labelText: 'كلمة المرور الجديدة',
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return ' ';
                            else if (!value.isStrongPassword)
                              return ' ';
                            else
                              return null;
                          },
                        ),
                        TextFieldLabel(label: 'تأكيد كلمة المرور'),
                        SizedBox(height: 10.h),
                        PasswordFormField(
                          controller: confirmPasswordController,
                          inputDecoration:
                              kformFieldInputAccentDecoration.copyWith(
                            counterText: ' ',
                          ),
                          style: textFormFieldAccentStyle,
                          hintText: 'أدخل التأكيد ..',
                          labelText: 'تأكيد كلمة المرور',
                          validator: (value) {
                            return value != passwordController.text
                                ? ' '
                                : null;
                          },
                          onFieldSubmitted: (_) => viewModel.saveData(),
                        ),
                        const BottomPadding(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomSubmitButton(
                accentColors: false,
                label: 'تأكيد',
                onPressed: () => viewModel.saveData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordHint extends StatelessWidget {
  const _PasswordHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: kcolorBluelight,
      fontSize: getValueForScreenType<double>(
        context: context,
        mobile: 14,
        tablet: 16,
      ),
    );
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kcolorBluelight.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'كلمة المرور الجديدة يجب أن تحتوي على:',
            style: style.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('حروف صغيرة "a-z"', style: style),
          Text('حروف كبيرة "A-Z"', style: style),
          Text('رقم 0-9', style: style),
          Text('رمز مثل (#\$٪@&?)', style: style),
        ],
      ),
    );
  }
}
