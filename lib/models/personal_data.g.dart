// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalData _$PersonalDataFromJson(Map<String, dynamic> json) {
  return PersonalData(
    json['nameInArabic'] as String,
    json['nameInEnglish'] as String,
    json['idNumber'] as String,
    json['isEditDisabled'] as bool,
    json['editBtnShow'] as bool,
  );
}

Map<String, dynamic> _$PersonalDataToJson(PersonalData instance) =>
    <String, dynamic>{
      'nameInArabic': instance.nameInArabic,
      'nameInEnglish': instance.nameInEnglish,
      'idNumber': instance.idNumber,
      'isEditDisabled': instance.isEditDisabled,
      'editBtnShow': instance.editBtnShow,
    };
