import 'package:flutter/material.dart';

const Color kcolorPrimaryBlue = Color(0xFF124067);
const Color kcolorBluelight = Color(0xFF1873ba);

const kMaterialColor = MaterialColor(
  0xFFD2662F,
  <int, Color>{
    50: Color(0xFF124067),
    100: Color(0xFF124067),
    200: Color(0xFF124067),
    300: Color(0xFF124067),
    400: Color(0xFF124067),
    500: Color(0xFF124067),
    600: Color(0xFF124067),
    700: Color(0xFF124067),
    800: Color(0xFF124067),
    900: Color(0xFF124067),
  },
);

const textFormFieldStyle = TextStyle(color: kcolorPrimaryBlue);
const kformFieldInputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  labelStyle: TextStyle(color: kcolorPrimaryBlue),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  isDense: true,
  counterText: '',
);
