import 'package:json_annotation/json_annotation.dart';

part 'representative_data.g.dart';

@JsonSerializable()
class RepresentativeData {
  final String? companyId;
  final String? representativeId;
  final String? nameInArabic;
  final String? nameInEnglish;
  final String? idNumber;
  final bool? isEditDisabled;

  const RepresentativeData(
    this.companyId,
    this.representativeId,
    this.nameInArabic,
    this.nameInEnglish,
    this.idNumber,
    this.isEditDisabled,
  );

  factory RepresentativeData.fromJson(Map<String, dynamic> json) =>
      _$RepresentativeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RepresentativeDataToJson(this);
}
