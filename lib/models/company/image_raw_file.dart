import 'dart:io';

import 'package:flutter/foundation.dart';

class CompanyImageRawFile {
  String companyFileId;
  String name;
  File file;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;

  CompanyImageRawFile({
    @required this.companyFileId,
    @required this.name,
    @required this.file,
    @required this.isEditDisabled,
    @required this.fileFullName,
    @required this.editBtnShow,
  });
}
