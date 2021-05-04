import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_file.g.dart';

@JsonSerializable()
class CompanyImageFile {
  String companyFileId;
  String name;
  String base64Content;
  bool isEditDisabled;
  String fileFullName;
  bool editBtnShow;

  CompanyImageFile({
    @required this.companyFileId,
    @required this.name,
    @required this.base64Content,
    this.isEditDisabled,
    this.fileFullName,
    this.editBtnShow,
  });

  factory CompanyImageFile.fromJson(Map<String, dynamic> json) =>
      _$CompanyImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyImageFileToJson(this);
}
