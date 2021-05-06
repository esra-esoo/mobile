// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representative_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepresentativeData _$RepresentativeDataFromJson(Map<String, dynamic> json) {
  return RepresentativeData(
    json['companyId'] as String,
    json['representativeId'] as String,
    json['nameInArabic'] as String,
    json['nameInEnglish'] as String,
    json['idNumber'] as String,
    json['isEditDisabled'] as bool,
  );
}

Map<String, dynamic> _$RepresentativeDataToJson(RepresentativeData instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'representativeId': instance.representativeId,
      'nameInArabic': instance.nameInArabic,
      'nameInEnglish': instance.nameInEnglish,
      'idNumber': instance.idNumber,
      'isEditDisabled': instance.isEditDisabled,
    };
