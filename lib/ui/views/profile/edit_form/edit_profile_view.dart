import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/profile_info.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_profile_view.form.dart';
import 'edit_profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'fullname'),
  FormTextField(name: 'familyName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phoneNumber'),
])
class EditProfileView extends StatelessWidget with $EditProfileView {
  final ProfileInfo profileInfo;
  EditProfileView({Key key, this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      onModelReady: (viewModel) {
        listenToFormUpdated(viewModel);
        if (profileInfo != null) {
          usernameController.text = profileInfo.username;
          fullnameController.text = profileInfo.fullname;
          familyNameController.text = profileInfo.familyName;
          emailController.text = profileInfo.email;
          phoneNumberController.text = profileInfo.phoneNumber;
        }
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
            color: kcolorPrimaryBlue,
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
                        TextFormField(
                          cursorColor: kcolorPrimaryBlue,
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          maxLength: 10,
                          readOnly: true,
                          enabled: false,
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
                        const BottomPadding(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomSubmitButton(
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
