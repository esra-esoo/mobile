import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/file_radio_tile.dart';
import 'package:huayati/ui/widgets/form/file_size_note.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:stacked/stacked.dart';

import 'individual_form_viewmodel.dart';

class IndividualFormView extends StatelessWidget {
  const IndividualFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualFormViewModel>.reactive(
      viewModelBuilder: () => IndividualFormViewModel(),
      builder: (context, viewModel, child) => BusyOverlay(
        primaryColors: true,
        show: viewModel.isBusy,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: kcolorPrimaryBlue),
            ),
            centerTitle: true,
            title: FormTitle(
              title: 'مستندات الأفراد',
              color: kcolorPrimaryBlue,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 30.w,
              right: 30.w,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 15.h),
                const FileSizeNote(),
                SizedBox(height: 30.h),
                TextFieldLabel(label: 'جواز السفر'),
                SizedBox(height: 10.h),
                ImagePickerField(
                  onChanged: (file) => viewModel.individualForm.passport = file,
                  imageFile: viewModel?.individualForm?.passport,
                ),
                SizedBox(height: 25.h),
                TextFieldLabel(label: 'مستند أخر'),
                FileRadioTile(
                  options: ['الرقم الوطني', 'شهادة الميلاد'],
                  groupValue: viewModel.individualForm?.extraFileType?.index,
                  onChanged: (int value) {
                    viewModel.onExtraTypeChanged(value);
                  },
                  onFileChanged: (file) =>
                      viewModel.individualForm.extraFile = file,
                  imageFile: viewModel?.individualForm?.extraFile,
                ),
                SizedBox(height: 15.h),
                TextFieldLabel(label: 'كشف الحساب'),
                SizedBox(height: 10.h),
                ImagePickerField(
                  onChanged: (file) =>
                      viewModel.individualForm.accountStatement = file,
                  imageFile: viewModel?.individualForm?.accountStatement,
                ),
                const BottomPadding(),
              ],
            ),
          ),
          bottomNavigationBar: BottomSubmitButton(
            label: 'رفع المستندات',
            accentColors: false,
            onPressed: () => viewModel.saveData(),
          ),
        ),
      ),
    );
  }
}
