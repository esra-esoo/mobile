import 'dart:io';

import 'package:flutter/foundation.dart';

class ImageRawFile {
  String individualFileId;
  String name;
  File file;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;

  ImageRawFile({
    @required this.individualFileId,
    @required this.name,
    @required this.file,
    @required this.isEditDisabled,
    @required this.fileFullName,
    @required this.editBtnShow,
  });
}
