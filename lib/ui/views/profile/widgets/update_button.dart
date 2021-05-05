import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:stacked/stacked.dart';

import '../profile_viewmodel.dart';

class UpdateProfileButton extends ViewModelWidget<ProfileViewModel> {
  const UpdateProfileButton({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return FlatButton(
      onPressed: () => viewModel.updateProfile(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      color: Colors.transparent,
      splashColor: kcolorBluelight,
      child: Text(
        'تعديل البيانات',
        style: TextStyle(
          color: kcolorBluelight,
          fontSize: 18,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
