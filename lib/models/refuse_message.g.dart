// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuse_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefuseMessage _$RefuseMessageFromJson(Map<String, dynamic> json) {
  return RefuseMessage(
    json['numberOfFiles'] as int,
    json['message'] as String,
    json['refuseType'] as String,
    (json['files'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RefuseMessageToJson(RefuseMessage instance) =>
    <String, dynamic>{
      'numberOfFiles': instance.numberOfFiles,
      'message': instance.message,
      'refuseType': instance.refuseType,
      'files': instance.files,
    };
