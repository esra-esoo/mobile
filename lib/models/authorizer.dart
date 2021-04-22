import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/enums/authorizer_extra_file_type.dart';

class Authorizer {
  File passport;
  File extraFile;
  AutorizerExtraFileType extraFileType;

  Authorizer({
    @required this.passport,
    @required this.extraFile,
    @required this.extraFileType,
  });
}
