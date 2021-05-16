// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PhoneNumberValueKey = 'phoneNumber';
const String UsernameValueKey = 'username';
const String FullnameValueKey = 'fullname';
const String FamilyNameValueKey = 'familyName';
const String EmailValueKey = 'email';

mixin $EditProfileView on StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode fullnameFocusNode = FocusNode();
  final FocusNode familyNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    phoneNumberController.addListener(() => _updateFormData(model));
    usernameController.addListener(() => _updateFormData(model));
    fullnameController.addListener(() => _updateFormData(model));
    familyNameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            PhoneNumberValueKey: phoneNumberController.text,
            UsernameValueKey: usernameController.text,
            FullnameValueKey: fullnameController.text,
            FamilyNameValueKey: familyNameController.text,
            EmailValueKey: emailController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    phoneNumberController.dispose();
    usernameController.dispose();
    fullnameController.dispose();
    familyNameController.dispose();
    emailController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];
  String? get usernameValue => this.formValueMap[UsernameValueKey];
  String? get fullnameValue => this.formValueMap[FullnameValueKey];
  String? get familyNameValue => this.formValueMap[FamilyNameValueKey];
  String? get emailValue => this.formValueMap[EmailValueKey];

  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
  bool get hasUsername => this.formValueMap.containsKey(UsernameValueKey);
  bool get hasFullname => this.formValueMap.containsKey(FullnameValueKey);
  bool get hasFamilyName => this.formValueMap.containsKey(FamilyNameValueKey);
  bool get hasEmail => this.formValueMap.containsKey(EmailValueKey);
}

extension Methods on FormViewModel {}
