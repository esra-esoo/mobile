import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/enums/extra_file_type.dart';

class IndividualForm {
  File passport;
  File extraFile;
  ExtraFileType extraFileType;
  File accountStatement;

  IndividualForm.initial()
      : passport = null,
        extraFile = null,
        extraFileType = null,
        accountStatement = null;

  IndividualForm({
    @required this.passport,
    @required this.extraFile,
    @required this.extraFileType,
    @required this.accountStatement,
  });
}
