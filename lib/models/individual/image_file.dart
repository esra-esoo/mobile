import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_file.g.dart';

@JsonSerializable()
class IndivisualImageFile {
  String individualFileId;
  String name;
  String base64Content;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;

  IndivisualImageFile({
    @required this.individualFileId,
    @required this.name,
    @required this.base64Content,
    this.isEditDisabled,
    this.fileFullName,
    this.editBtnShow,
  });

  factory IndivisualImageFile.fromJson(Map<String, dynamic> json) =>
      _$IndivisualImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$IndivisualImageFileToJson(this);
}
