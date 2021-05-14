import 'package:flutter/material.dart';
import 'package:huayati/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountTypesRadio extends ViewModelWidget<SignUpViewModel> {
  const AccountTypesRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, SignUpViewModel viewModel) {
    return Wrap(
      direction: Axis.horizontal,
      children: List<Widget>.generate(
        viewModel.accountTypes.length,
        (int i) => Theme(
          // data: ThemeData.dark(),
          data:
              Theme.of(context).copyWith(unselectedWidgetColor: Colors.white60),
          child: RadioListTile<String>(
            activeColor: Colors.white,
            title: Text(
              viewModel.accountTypes[i],
              style: TextStyle(color: Colors.white),
            ),
            value: viewModel.accountTypes[i],
            groupValue: viewModel.selectedType,
            onChanged: viewModel.onAccountTypeChanged,
          ),
        ),
      ),
    );
  }
}
