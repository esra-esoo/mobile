import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/form/file_radio_tile.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'company_form_viewmodel.dart';
import 'widgets/add_authorizer_btn.dart';
import 'widgets/text_field_label.dart';

class AuthorizersFormView extends ViewModelWidget<CompanyViewModel> {
  const AuthorizersFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.authorizers.length + 1,
        itemBuilder: (context, index) {
          if (viewModel.authorizers.length == index)
            return AddAuthorizerButton(
              onPressed: () => viewModel.addAuthorizer(),
            );
          else
            return _AuthorizerFieldsCard(index: index);
        },
      ),
    );
  }
}

class _AuthorizerFieldsCard extends ViewModelWidget<CompanyViewModel> {
  final int index;
  const _AuthorizerFieldsCard({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyViewModel viewModel) {
    var authorizer = viewModel.authorizers[index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(const Radius.circular(15.0)),
        border: Border.all(color: kcolorBluelight.withOpacity(0.3), width: 2),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldLabel(label: 'جواز السفر'),
          SizedBox(height: 10.h),
          ImagePickerField(
            onChanged: (file) => viewModel.authorizers[index].passport = file,
            imageFile: authorizer.passport,
          ),
          SizedBox(height: 25.h),
          TextFieldLabel(label: 'مستند إضافي'),
          FileRadioTile(
            options: ['الرقم الوطني', 'شهادة الميلاد'],
            groupValue: viewModel.authorizers[index]?.extraFileType?.index,
            onChanged: (int value) {
              viewModel.onAuthorizerExtraTypeChanged(index, value);
            },
            imageFile: viewModel.authorizers[index]?.extraFile,
            onFileChanged: (file) =>
                viewModel.authorizers[index].extraFile = file,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                visualDensity: VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                color: Colors.red,
                icon: Icon(CupertinoIcons.delete),
                onPressed: () => viewModel.removeAuthorizer(index),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
