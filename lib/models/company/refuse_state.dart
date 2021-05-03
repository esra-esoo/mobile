import 'package:json_annotation/json_annotation.dart';

part 'refuse_state.g.dart';

@JsonSerializable()
class CompanyRefuseState {
  final bool hasRefusedCompanyFiles;
  final bool hasRefusedRepresentativeFiles;
  final int numberOfCompanyFiles;
  final int numberOfRepresentativeFiles;
  final String refuseType;
  final List<String> companyRefuseFiles;
  final List<String> representativeRefuseFiles;

  const CompanyRefuseState(
    this.hasRefusedCompanyFiles,
    this.hasRefusedRepresentativeFiles,
    this.numberOfCompanyFiles,
    this.numberOfRepresentativeFiles,
    this.refuseType,
    this.companyRefuseFiles,
    this.representativeRefuseFiles,
  );

  CompanyRefuseState.initial()
      : hasRefusedCompanyFiles = false,
        hasRefusedRepresentativeFiles = false,
        numberOfCompanyFiles = 0,
        numberOfRepresentativeFiles = 0,
        refuseType = null,
        companyRefuseFiles = null,
        representativeRefuseFiles = null;

  factory CompanyRefuseState.fromJson(Map<String, dynamic> json) =>
      _$CompanyRefuseStateFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRefuseStateToJson(this);
}