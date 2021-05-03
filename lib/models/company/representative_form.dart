import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/enums/group_file_type.dart';

class RepresentativeForm {
  File passport;
  File groupFile;
  GroupFileType groupFileType;

  RepresentativeForm({
    @required this.passport,
    @required this.groupFile,
    @required this.groupFileType,
  });
}
