// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) {
  return CompanyData(
    json['companyName'] as String,
    json['licenseNumber'] as String,
    json['commercialNo'] as String,
    json['importersRecord'] as String,
    json['chamberOfCommerce'] as String,
    json['isEditDisabled'] as bool,
    json['editBtnShow'] as bool,
  );
}

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'licenseNumber': instance.licenseNumber,
      'commercialNo': instance.commercialNo,
      'importersRecord': instance.importersRecord,
      'chamberOfCommerce': instance.chamberOfCommerce,
      'isEditDisabled': instance.isEditDisabled,
      'editBtnShow': instance.editBtnShow,
    };
