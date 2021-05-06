import 'dart:io';

import 'package:flutter/foundation.dart';

class RepresentativeImageRawFile {
  String representativeFileId;
  String representativeId;
  String name;
  File file;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;
  bool isFirst;

  RepresentativeImageRawFile({
    @required this.representativeFileId,
    @required this.representativeId,
    @required this.name,
    @required this.file,
    @required this.isEditDisabled,
    @required this.fileFullName,
    @required this.editBtnShow,
    @required this.isFirst,
  });
}
