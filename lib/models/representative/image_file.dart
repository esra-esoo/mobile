import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_file.g.dart';

@JsonSerializable()
class RepresentativeImageFile {
  String representativeFileId;
  String representativeId;
  String name;
  String base64Content;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;

  RepresentativeImageFile({
    @required this.representativeFileId,
    @required this.representativeId,
    @required this.name,
    @required this.base64Content,
    this.isEditDisabled,
    this.fileFullName,
    this.editBtnShow,
  });

  factory RepresentativeImageFile.fromJson(Map<String, dynamic> json) =>
      _$RepresentativeImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$RepresentativeImageFileToJson(this);
}
