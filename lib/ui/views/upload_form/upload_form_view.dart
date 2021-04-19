import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:stacked/stacked.dart';

import 'upload_form_viewmodel.dart';
import 'widgets/file_size_note.dart';
import 'widgets/text_field_label.dart';

class UploadFormView extends StatelessWidget {
  const UploadFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadFormViewModel>.reactive(
      viewModelBuilder: () => UploadFormViewModel(),
      builder: (context, viewModel, child) => BusyOverlay(
        primaryColors: true,
        show: viewModel.isBusy,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
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
                  FormTitle(
                    title: 'رفع صور المستندات',
                    color: kcolorBluelight,
                  ),
                  SizedBox(height: 15.h),
                  const FileSizeNote(),
                  SizedBox(height: 40.h),
                  TextFieldLabel(label: 'الرخصة التجارية'),
                  SizedBox(height: 10.h),
                  ImagePickerField(
                    onChanged: (file) => viewModel.file1 = file,
                    imageFile: viewModel.file1,
                  ),
                  SizedBox(height: 30.h),
                  TextFieldLabel(label: 'السجل التجاري'),
                  SizedBox(height: 10.h),
                  ImagePickerField(
                    onChanged: (file) => viewModel.file2 = file,
                    imageFile: viewModel.file2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
