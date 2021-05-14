// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEmployeeModel _$CompanyEmployeeModelFromJson(Map<String, dynamic> json) {
  return CompanyEmployeeModel(
    userId: json['userId'] as String?,
    companyEmployeeFilesModel:
        (json['companyEmployeeFilesModel'] as List<dynamic>?)
            ?.map((e) => FilesModels.fromJson(e as Map<String, dynamic>))
            .toList(),
    totalFilesLength: json['totalFilesLength'] as int?,
    isFirstRepresentative: json['isFirstRepresentative'] as bool?,
  );
}

Map<String, dynamic> _$CompanyEmployeeModelToJson(
        CompanyEmployeeModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'companyEmployeeFilesModel':
          instance.companyEmployeeFilesModel?.map((e) => e.toJson()).toList(),
      'totalFilesLength': instance.totalFilesLength,
      'isFirstRepresentative': instance.isFirstRepresentative,
    };
