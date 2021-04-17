import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onFieldSubmitted;
  final bool lengthValidationRequired;

  const PasswordFormField({
    @required this.controller,
    @required this.onFieldSubmitted,
    this.lengthValidationRequired = true,
  });

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.white,
      autocorrect: false,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      style: textFormFieldStyle,
      decoration: kformFieldInputDecoration.copyWith(
        hintText: 'أدخل كلمة المرور هنا ..',
        labelText: 'كلمة المرور (*)',
        suffixIcon: GestureDetector(
          child: Icon(
            _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            color: kcolorPrimaryBlue,
          ),
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
