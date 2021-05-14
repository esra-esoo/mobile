import 'dart:io';

import 'package:huayati/enums/group_file_type.dart';

class IndividualForm {
  File? passport;
  File? groupFile;
  File? groupFile2;
  GroupFileType? groupFileType;
  GroupFileType2? groupFileType2;

  IndividualForm.initial()
      : passport = null,
        groupFile = null,
        groupFile2 = null,
        groupFileType = null,
        groupFileType2 = null;

  IndividualForm({
    required this.passport,
    required this.groupFile,
    required this.groupFile2,
    required this.groupFileType,
    required this.groupFileType2,
  });
}
