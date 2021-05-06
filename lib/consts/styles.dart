import 'package:flutter/material.dart';

const Color kcolorPrimaryBlue = Color(0xFF124067);
const Color kcolorBluelight = Color(0xFF1873ba);
const Color kColorCard = const Color(0xFFEFEFEF);
const Color kColorText = const Color(0xFF8B8B8B);
const Color kColorBlackButton = const Color(0xFF303030);

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
const textFormFieldAccentStyle = TextStyle(color: kColorBlackButton);
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
  errorBorder: OutlineInputBorder(
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
  counterStyle: TextStyle(color: Colors.white),
  // counterText: '',
);

const kformFieldInputAccentDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
    borderSide: BorderSide(color: kColorBlackButton),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(15.0),
    ),
    borderSide: BorderSide(color: kColorText),
  ),
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  labelStyle: TextStyle(color: kColorText),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  isDense: true,
  counterStyle: TextStyle(color: Colors.grey),
);
