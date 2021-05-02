// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) {
  return ImageFile(
    individualFileId: json['individualFileId'] as String,
    name: json['name'] as String,
    base64Content: json['base64Content'] as String,
    isEditDisabled: json['isEditDisabled'] as bool,
    fileFullName: json['fileFullName'] as String,
    editBtnShow: json['editBtnShow'] as bool,
  );
}

Map<String, dynamic> _$ImageFileToJson(ImageFile instance) => <String, dynamic>{
      'individualFileId': instance.individualFileId,
      'name': instance.name,
      'base64Content': instance.base64Content,
      'isEditDisabled': instance.isEditDisabled,
      'fileFullName': instance.fileFullName,
      'editBtnShow': instance.editBtnShow,
    };
