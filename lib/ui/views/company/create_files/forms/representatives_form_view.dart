import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/form/file_radio_tile.dart';
import 'package:huayati/ui/widgets/form/image_picker_field.dart';
import 'package:huayati/ui/widgets/form/text_field_label.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../create_files_viewmodel.dart';

class RepresentativesFormView
    extends ViewModelWidget<CompanyCreateFilesViewModel> {
  const RepresentativesFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyCreateFilesViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.representatives.length + 1,
        itemBuilder: (context, index) {
          if (viewModel.representatives.length == index)
            return _AddRepresentativeButton(
              onPressed: () => viewModel.addRepresentative(),
            );
          else
            return _RepresentativeFieldsCard(index: index);
        },
      ),
    );
  }
}

class _AddRepresentativeButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AddRepresentativeButton({Key key, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        color: Colors.transparent,
        splashColor: kcolorBluelight,
        onPressed: onPressed,
        child: Column(
          children: <Widget>[
            const Icon(Icons.add, color: kcolorBluelight, size: 30),
            const SizedBox(height: 5),
            Text(
              'إضافة مخول',
              style: TextStyle(
                color: kcolorBluelight,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RepresentativeFieldsCard
    extends ViewModelWidget<CompanyCreateFilesViewModel> {
  final int index;
  const _RepresentativeFieldsCard({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyCreateFilesViewModel viewModel) {
    var authorizer = viewModel.representatives[index];
    return Column(
      children: [
        Text(
          'مخول رقم ${index + 1}',
          style: TextStyle(
            color: kcolorBluelight,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(15.0)),
            border:
                Border.all(color: kcolorBluelight.withOpacity(0.3), width: 2),
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
                onChanged: (file) {
                  viewModel.representatives[index].passport = file;
                  viewModel.notifyListeners();
                },
                imageFile: authorizer.passport,
              ),
              SizedBox(height: 25.h),
              TextFieldLabel(label: 'أختر مستند'),
              FileRadioTile(
                options: ['الرقم الوطني', 'شهادة الميلاد'],
                groupValue:
                    viewModel.representatives[index]?.groupFileType?.index,
                onChanged: (int value) {
                  viewModel.onRepresentativeExtraTypeChanged(index, value);
                },
                onFileChanged: (file) {
                  viewModel.representatives[index].groupFile = file;
                  viewModel.notifyListeners();
                },
                imageFile: viewModel.representatives[index]?.groupFile,
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
                    onPressed: () => viewModel.removeRepresentative(index),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
