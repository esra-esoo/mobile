// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_refuse_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedRefuseState _$SharedRefuseStateFromJson(Map<String, dynamic> json) {
  return SharedRefuseState(
    indivisualRefuseState: json['indivisualRefuseState'] == null
        ? null
        : IndivisualRefuseState.fromJson(
            json['indivisualRefuseState'] as Map<String, dynamic>),
    companyRefuseState: json['companyRefuseState'] == null
        ? null
        : CompanyRefuseState.fromJson(
            json['companyRefuseState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharedRefuseStateToJson(SharedRefuseState instance) =>
    <String, dynamic>{
      'indivisualRefuseState': instance.indivisualRefuseState?.toJson(),
      'companyRefuseState': instance.companyRefuseState?.toJson(),
    };
