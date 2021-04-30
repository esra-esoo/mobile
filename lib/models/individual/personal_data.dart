import 'package:json_annotation/json_annotation.dart';

part 'personal_data.g.dart';

@JsonSerializable()
class PersonalData {
  final String nameInArabic;
  final String nameInEnglish;
  final String idNumber;
  final bool isEditDisabled;
  final bool editBtnShow;

  const PersonalData(
    this.nameInArabic,
    this.nameInEnglish,
    this.idNumber,
    this.isEditDisabled,
    this.editBtnShow,
  );

  factory PersonalData.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalDataToJson(this);
}
