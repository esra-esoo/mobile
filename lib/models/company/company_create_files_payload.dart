import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../file_models.dart';
import 'company_employee_model.dart';

part 'company_create_files_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyCreateFilePayload {
  final String phoneNumber;
  final List<FilesModels> companyFilesModel;
  final CompanyEmployeeModel companyEmployeeModel;
  final int totalFilesLength;

  const CompanyCreateFilePayload({
    @required this.phoneNumber,
    @required this.companyFilesModel,
    @required this.companyEmployeeModel,
    this.totalFilesLength,
  });

  factory CompanyCreateFilePayload.fromJson(Map<String, dynamic> json) =>
      _$CompanyCreateFilePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyCreateFilePayloadToJson(this);
}
