import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/profile_info.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_profile_view.form.dart';
import 'edit_profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'username'),
  FormTextField(name: 'fullname'),
  FormTextField(name: 'familyName'),
  FormTextField(name: 'email'),
])
class EditProfileView extends StatelessWidget with $EditProfileView {
  final ProfileInfo profileInfo;
  EditProfileView({Key key, this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      onModelReady: (viewModel) async {
        listenToFormUpdated(viewModel);
        await viewModel.initilizeView(profileInfo);
        phoneNumberController.text = viewModel.profileInfo.phoneNumber;
        usernameController.text = viewModel.profileInfo.username;
        fullnameController.text = viewModel.profileInfo.fullname;
        familyNameController.text = viewModel.profileInfo.familyName;
        emailController.text = viewModel.profileInfo.email;
      },
      onDispose: () => disposeForm(),
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: BusyOverlay(
          show: viewModel.isBusy,
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
                ),
                centerTitle: true,
                title: FormTitle(
                  title: 'تعديل الملف الشخصي',
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
                        TextFieldLabel(label: 'رقم الهاتف'),
                        SizedBox(height: 10.h),
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          enabled: false,
                          style: textFormFieldAccentStyle,
                          decoration: kformFieldInputAccentDecoration.copyWith(
                            labelText: 'رقم الهاتف (*)',
                            fillColor: kColorCard,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldLabel(label: 'اسم المستخدم'),
                        SizedBox(height: 10.h),
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          enabled: false,
                          style: textFormFieldAccentStyle,
                          decoration: kformFieldInputAccentDecoration.copyWith(
                            hintText: 'إسم المستخدم',
                            fillColor: kColorCard,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldLabel(label: 'الإسم كامل(*)'),
                        SizedBox(height: 10.h),
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: fullnameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          style: textFormFieldAccentStyle,
                          decoration: kformFieldInputAccentDecoration.copyWith(
                            hintText: 'أدخل الاسم كامل هنا ..',
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldLabel(label: 'اللقب(*)'),
                        SizedBox(height: 10.h),
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: familyNameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          style: textFormFieldAccentStyle,
                          decoration: kformFieldInputAccentDecoration.copyWith(
                            hintText: 'أدخل اللقب هنا ..',
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldLabel(label: 'البريد الإلكتروني'),
                        SizedBox(height: 10.h),
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          style: textFormFieldAccentStyle,
                          decoration: kformFieldInputAccentDecoration.copyWith(
                            hintText: 'ادخل عنوان البريد الالكتروني',
                          ),
                        ),
                        const BottomPadding(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomSubmitButton(
                accentColors: false,
                label: 'حفظ التعديلات',
                onPressed: () => viewModel.saveData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
