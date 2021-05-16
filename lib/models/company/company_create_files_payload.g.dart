// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_create_files_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyCreateFilesPayload _$CompanyCreateFilesPayloadFromJson(
    Map<String, dynamic> json) {
  return CompanyCreateFilesPayload(
    phoneNumber: json['phoneNumber'] as String?,
    companyFilesModel: (json['companyFilesModel'] as List<dynamic>?)
        ?.map((e) => FilesModels.fromJson(e as Map<String, dynamic>))
        .toList(),
    companyEmployeeModel: (json['companyEmployeeModel'] as List<dynamic>?)
        ?.map((e) => CompanyEmployeeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalFilesLength: json['totalFilesLength'] as int?,
  );
}

Map<String, dynamic> _$CompanyCreateFilesPayloadToJson(
        CompanyCreateFilesPayload instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'companyFilesModel':
          instance.companyFilesModel?.map((e) => e.toJson()).toList(),
      'companyEmployeeModel':
          instance.companyEmployeeModel?.map((e) => e.toJson()).toList(),
      'totalFilesLength': instance.totalFilesLength,
    };
