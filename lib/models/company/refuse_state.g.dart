// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuse_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRefuseState _$CompanyRefuseStateFromJson(Map<String, dynamic> json) {
  return CompanyRefuseState(
    json['companyMessage'] as String?,
    json['representativeMessage'] as String?,
    json['hasRefusedCompanyFiles'] as bool?,
    json['hasRefusedRepresentativeFiles'] as bool?,
    json['numberOfCompanyFiles'] as int?,
    json['numberOfRepresentativeFiles'] as int?,
    json['refuseType'] as String?,
  );
}

Map<String, dynamic> _$CompanyRefuseStateToJson(CompanyRefuseState instance) =>
    <String, dynamic>{
      'companyMessage': instance.companyMessage,
      'representativeMessage': instance.representativeMessage,
      'hasRefusedCompanyFiles': instance.hasRefusedCompanyFiles,
      'hasRefusedRepresentativeFiles': instance.hasRefusedRepresentativeFiles,
      'numberOfCompanyFiles': instance.numberOfCompanyFiles,
      'numberOfRepresentativeFiles': instance.numberOfRepresentativeFiles,
      'refuseType': instance.refuseType,
    };
