// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) {
  return ImageFile(
    json['individualFileId'] as String,
    json['name'] as String,
    json['base64Content'] as String,
    json['isEditDisabled'] as bool,
    json['fileFullName'] as String,
    json['editBtnShow'] as bool,
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
