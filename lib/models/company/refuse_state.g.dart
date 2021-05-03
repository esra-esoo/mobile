// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuse_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRefuseState _$CompanyRefuseStateFromJson(Map<String, dynamic> json) {
  return CompanyRefuseState(
    json['hasRefusedCompanyFiles'] as bool,
    json['hasRefusedRepresentativeFiles'] as bool,
    json['numberOfCompanyFiles'] as int,
    json['numberOfRepresentativeFiles'] as int,
    json['refuseType'] as String,
    (json['companyRefuseFiles'] as List)?.map((e) => e as String)?.toList(),
    (json['representativeRefuseFiles'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$CompanyRefuseStateToJson(CompanyRefuseState instance) =>
    <String, dynamic>{
      'hasRefusedCompanyFiles': instance.hasRefusedCompanyFiles,
      'hasRefusedRepresentativeFiles': instance.hasRefusedRepresentativeFiles,
      'numberOfCompanyFiles': instance.numberOfCompanyFiles,
      'numberOfRepresentativeFiles': instance.numberOfRepresentativeFiles,
      'refuseType': instance.refuseType,
      'companyRefuseFiles': instance.companyRefuseFiles,
      'representativeRefuseFiles': instance.representativeRefuseFiles,
    };
