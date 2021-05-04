import 'package:json_annotation/json_annotation.dart';

part 'company_data.g.dart';

@JsonSerializable()
class CompanyData {
  final String companyName;
  final String licenseNumber;
  final String commercialNo;
  final String importersRecord;
  final String chamberOfCommerce;
  final bool isEditDisabled;
  final bool editBtnShow;

  const CompanyData(
    this.companyName,
    this.licenseNumber,
    this.commercialNo,
    this.importersRecord,
    this.chamberOfCommerce,
    this.isEditDisabled,
    this.editBtnShow,
  );

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);
}
