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

import 'create_files_viewmodel.dart';

class IndividualCreateFilesView extends StatelessWidget {
  const IndividualCreateFilesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualCreateFilesViewModel>.reactive(
      viewModelBuilder: () => IndividualCreateFilesViewModel(),
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
              icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
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
                TextFieldLabel(label: 'أختر مستند'),
                FileRadioTile(
                  options: ['الرقم الوطني', 'شهادة الميلاد'],
                  groupValue: viewModel.individualForm?.groupFileType?.index,
                  onChanged: (int value) {
                    viewModel.onExtraTypeChanged(value);
                  },
                  onFileChanged: (file) =>
                      viewModel.individualForm.groupFile = file,
                  imageFile: viewModel?.individualForm?.groupFile,
                ),
                SizedBox(height: 25.h),
                TextFieldLabel(label: 'أختر مستند'),
                FileRadioTile(
                  options: ['كشف الحساب', 'صك'],
                  groupValue: viewModel.individualForm?.groupFileType2?.index,
                  onChanged: (int value) {
                    viewModel.onExtraType2Changed(value);
                  },
                  onFileChanged: (file) =>
                      viewModel.individualForm.groupFile2 = file,
                  imageFile: viewModel?.individualForm?.groupFile2,
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
