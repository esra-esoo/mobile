import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:stacked/stacked.dart';

import '../profile_viewmodel.dart';

class UpdateProfileButton extends ViewModelWidget<ProfileViewModel> {
  const UpdateProfileButton({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ).copyWith(
        overlayColor:
            MaterialStateProperty.resolveWith<Color>((states) => kColorCard),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => kcolorBluelight,
        ),
      ),
      child: Text(
        'تعديل البيانات',
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 1,
        ),
      ),
      onPressed: () => viewModel.updateProfile(),
    );
  }
}
