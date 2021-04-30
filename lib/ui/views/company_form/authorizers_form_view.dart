import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/form/file_radio_tile.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'company_form_viewmodel.dart';
import 'widgets/add_authorizer_btn.dart';
import '../../widgets/form/text_field_label.dart';

class AuthorizersFormView extends ViewModelWidget<CompanyFormViewModel> {
  const AuthorizersFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyFormViewModel viewModel) {
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

class _AuthorizerFieldsCard extends ViewModelWidget<CompanyFormViewModel> {
  final int index;
  const _AuthorizerFieldsCard({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyFormViewModel viewModel) {
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
          TextFieldLabel(label: 'مستند أخر'),
          FileRadioTile(
            options: ['الرقم الوطني', 'شهادة الميلاد'],
            groupValue: viewModel.authorizers[index]?.groupFileType?.index,
            onChanged: (int value) {
              viewModel.onAuthorizerExtraTypeChanged(index, value);
            },
            imageFile: viewModel.authorizers[index]?.groupFile,
            onFileChanged: (file) =>
                viewModel.authorizers[index].groupFile = file,
          ),
          SizedBox(height: 15.h),
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
