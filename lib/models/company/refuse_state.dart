import 'package:json_annotation/json_annotation.dart';

part 'refuse_state.g.dart';

@JsonSerializable()
class CompanyRefuseState {
  final String? companyMessage;
  final String? representativeMessage;
  final bool? hasRefusedCompanyFiles;
  final bool? hasRefusedRepresentativeFiles;
  final int? numberOfCompanyFiles;
  final int? numberOfRepresentativeFiles;
  final String? refuseType;

  const CompanyRefuseState(
    this.companyMessage,
    this.representativeMessage,
    this.hasRefusedCompanyFiles,
    this.hasRefusedRepresentativeFiles,
    this.numberOfCompanyFiles,
    this.numberOfRepresentativeFiles,
    this.refuseType,
  );

  CompanyRefuseState.initial()
      : companyMessage = null,
        representativeMessage = null,
        hasRefusedCompanyFiles = false,
        hasRefusedRepresentativeFiles = false,
        numberOfCompanyFiles = 0,
        numberOfRepresentativeFiles = 0,
        refuseType = null;

  factory CompanyRefuseState.fromJson(Map<String, dynamic> json) =>
      _$CompanyRefuseStateFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRefuseStateToJson(this);
}
