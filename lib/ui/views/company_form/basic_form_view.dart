import 'package:flutter/material.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/form/file_size_note.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'company_form_viewmodel.dart';

class BasicFormView extends ViewModelWidget<CompanyFormViewModel> {
  const BasicFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyFormViewModel viewModel) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 15.h),
        const FileSizeNote(),
        SizedBox(height: 30.h),
        TextFieldLabel(label: 'الرخصة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.companyForm.commercialLicense = file,
          imageFile: viewModel?.companyForm?.commercialLicense,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'السجل التجاري'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.companyForm.commercialRegister = file,
          imageFile: viewModel?.companyForm?.commercialLicense,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'سجل المستوردين'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.companyForm.importersRecord = file,
          imageFile: viewModel?.companyForm?.importersRecord,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'الغرفة التجارية'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.companyForm.chamberOfCommerce = file,
          imageFile: viewModel?.companyForm?.chamberOfCommerce,
        ),
        SizedBox(height: 25.h),
        TextFieldLabel(label: 'كشف الحساب'),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: (file) => viewModel.companyForm.accountStatement = file,
          imageFile: viewModel?.companyForm?.accountStatement,
        ),
        const BottomPadding(),
      ],
    );
  }
}
