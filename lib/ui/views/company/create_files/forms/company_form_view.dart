import 'package:flutter/material.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/form/file_radio_tile.dart';
import 'package:huayati/ui/widgets/form/file_size_note.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../create_files_viewmodel.dart';

class CompanyFormView extends ViewModelWidget<CompanyCreateFilesViewModel> {
  const CompanyFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyCreateFilesViewModel viewModel) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 15.h),
        const FileSizeNote(),
        SizedBox(height: 30.h),
        TextFieldLabel(label: 'الرخصة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) {
            viewModel.companyForm.commercialLicense = file;
            viewModel.notifyListeners();
          },
          imageFile: viewModel.companyForm.commercialLicense,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'السجل التجاري'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) {
            viewModel.companyForm.commercialRegister = file;
            viewModel.notifyListeners();
          },
          imageFile: viewModel.companyForm.commercialRegister,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'سجل المستوردين'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) {
            viewModel.companyForm.importersRecord = file;
            viewModel.notifyListeners();
          },
          imageFile: viewModel.companyForm.importersRecord,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'الغرفة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) {
            viewModel.companyForm.chamberOfCommerce = file;
            viewModel.notifyListeners();
          },
          imageFile: viewModel.companyForm.chamberOfCommerce,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'أختر مستند'),
        FileRadioTile(
          options: ['كشف الحساب', 'صك'],
          groupValue: viewModel.companyForm.groupFileType2?.index,
          onChanged: (int value) {
            viewModel.onExtraType2Changed(value);
          },
          onFileChanged: (file) {
            viewModel.companyForm.groupFile2 = file;
            viewModel.notifyListeners();
          },
          imageFile: viewModel.companyForm.groupFile2,
        ),
        const BottomPadding(),
      ],
    );
  }
}
