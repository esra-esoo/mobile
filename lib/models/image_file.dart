import 'package:json_annotation/json_annotation.dart';

part 'image_file.g.dart';

@JsonSerializable()
class ImageFile {
  final String individualFileId;
  final String name;
  final String base64Content;
  final bool isEditDisabled;
  final String fileFullName;
  final bool editBtnShow;

  const ImageFile(
    this.individualFileId,
    this.name,
    this.base64Content,
    this.isEditDisabled,
    this.fileFullName,
    this.editBtnShow,
  );

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _$ImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$ImageFileToJson(this);
}
