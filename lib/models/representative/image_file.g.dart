// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepresentativeImageFile _$RepresentativeImageFileFromJson(
    Map<String, dynamic> json) {
  return RepresentativeImageFile(
    representativeFileId: json['representativeFileId'] as String,
    representativeId: json['representativeId'] as String,
    name: json['name'] as String,
    base64Content: json['base64Content'] as String,
    isEditDisabled: json['isEditDisabled'] as bool,
    fileFullName: json['fileFullName'] as String,
    editBtnShow: json['editBtnShow'] as bool,
    isFirst: json['isFirst'] as bool,
  );
}

Map<String, dynamic> _$RepresentativeImageFileToJson(
        RepresentativeImageFile instance) =>
    <String, dynamic>{
      'representativeFileId': instance.representativeFileId,
      'representativeId': instance.representativeId,
      'name': instance.name,
      'base64Content': instance.base64Content,
      'isEditDisabled': instance.isEditDisabled,
      'fileFullName': instance.fileFullName,
      'editBtnShow': instance.editBtnShow,
      'isFirst': instance.isFirst,
    };
