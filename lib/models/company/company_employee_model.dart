import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../file_models.dart';

part 'company_employee_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyEmployeeModel {
  final String userId;
  final List<FilesModels> companyEmployeeFilesModel;
  final int totalFilesLength;
  final bool isFirstRepresentative;

  const CompanyEmployeeModel({
    @required this.userId,
    @required this.companyEmployeeFilesModel,
    this.totalFilesLength,
    @required this.isFirstRepresentative,
  });

  factory CompanyEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyEmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyEmployeeModelToJson(this);
}
