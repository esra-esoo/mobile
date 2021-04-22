import 'package:flutter/material.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'company_form_viewmodel.dart';
import 'widgets/file_size_note.dart';
import 'widgets/text_field_label.dart';

class BasicFormView extends ViewModelWidget<CompanyViewModel> {
  const BasicFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyViewModel viewModel) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 15.h),
        const FileSizeNote(),
        SizedBox(height: 30.h),
        TextFieldLabel(label: 'الرخصة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.file1 = file,
          imageFile: viewModel.file1,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'السجل التجاري'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.file2 = file,
          imageFile: viewModel.file2,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'سجل المستوردين'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.file3 = file,
          imageFile: viewModel.file3,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'الغرفة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.file4 = file,
          imageFile: viewModel.file4,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'كشف الحساب'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.file5 = file,
          imageFile: viewModel.file5,
        ),
        const BottomPadding(),
      ],
    );
  }
}
