// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuse_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndivisualRefuseState _$IndivisualRefuseStateFromJson(
    Map<String, dynamic> json) {
  return IndivisualRefuseState(
    json['numberOfFiles'] as int,
    json['message'] as String,
    json['refuseType'] as String,
    (json['files'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$IndivisualRefuseStateToJson(
        IndivisualRefuseState instance) =>
    <String, dynamic>{
      'numberOfFiles': instance.numberOfFiles,
      'message': instance.message,
      'refuseType': instance.refuseType,
      'files': instance.files,
    };
