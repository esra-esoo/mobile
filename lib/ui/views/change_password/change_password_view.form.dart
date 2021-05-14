// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CurrentPasswordValueKey = 'currentPassword';
const String PasswordValueKey = 'password';
const String ConfirmPasswordValueKey = 'confirmPassword';

mixin $ChangePasswordView on StatelessWidget {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode currentPasswordFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    currentPasswordController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        {
          CurrentPasswordValueKey: currentPasswordController.text,
          PasswordValueKey: passwordController.text,
          ConfirmPasswordValueKey: confirmPasswordController.text,
        },
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get currentPasswordValue => this.formValueMap[CurrentPasswordValueKey];
  String? get passwordValue => this.formValueMap[PasswordValueKey];
  String? get confirmPasswordValue => this.formValueMap[ConfirmPasswordValueKey];
}
