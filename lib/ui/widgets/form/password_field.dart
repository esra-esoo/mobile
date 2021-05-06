import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onFieldSubmitted;
  final String Function(String) validator;
  final bool lengthValidationRequired;
  final String hintText;
  final String labelText;
  final InputDecoration inputDecoration;
  final TextStyle style;
  final TextInputAction textInputAction;
  const PasswordFormField({
    @required this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.lengthValidationRequired = true,
    this.inputDecoration = kformFieldInputDecoration,
    this.style = textFormFieldStyle,
    this.hintText,
    this.labelText,
    this.textInputAction,
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
      cursorColor: kcolorPrimaryBlue,
      autocorrect: false,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      style: widget.style,
      decoration: widget.inputDecoration.copyWith(
        hintText: widget.hintText ?? 'أدخل كلمة المرور هنا ..',
        labelText: widget.labelText ?? 'كلمة المرور (*)',
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
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
