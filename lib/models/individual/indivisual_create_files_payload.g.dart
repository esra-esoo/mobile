// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indivisual_create_files_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndivisualCreateFilesPayload _$IndivisualCreateFilesPayloadFromJson(
    Map<String, dynamic> json) {
  return IndivisualCreateFilesPayload(
    phoneNumber: json['phoneNumber'] as String,
    filesModels: (json['filesModels'] as List)
        ?.map((e) =>
            e == null ? null : FilesModels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    length: json['length'] as int,
  );
}

Map<String, dynamic> _$IndivisualCreateFilesPayloadToJson(
        IndivisualCreateFilesPayload instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'filesModels': instance.filesModels?.map((e) => e?.toJson())?.toList(),
      'length': instance.length,
    };
