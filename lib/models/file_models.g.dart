// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilesModels _$FilesModelsFromJson(Map<String, dynamic> json) {
  return FilesModels(
    name: json['name'] as String?,
    fileFullName: json['fileFullName'] as String?,
    fileBytes: json['fileBytes'] as String?,
    length: json['length'] as int?,
  );
}

Map<String, dynamic> _$FilesModelsToJson(FilesModels instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fileFullName': instance.fileFullName,
      'fileBytes': instance.fileBytes,
      'length': instance.length,
    };
