import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/enums/extra_file_type.dart';

class AuthorizerForm {
  File passport;
  File extraFile;
  ExtraFileType extraFileType;

  AuthorizerForm({
    @required this.passport,
    @required this.extraFile,
    @required this.extraFileType,
  });
}
