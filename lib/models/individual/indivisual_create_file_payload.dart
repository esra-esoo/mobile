import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part '../indivisual_create_file_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class IndivisualCreateFilePayload {
  final String phoneNumber;
  final List<FilesModels> filesModels;
  final int length;

  const IndivisualCreateFilePayload({
    @required this.phoneNumber,
    @required this.filesModels,
    this.length,
  });

  factory IndivisualCreateFilePayload.fromJson(Map<String, dynamic> json) =>
      _$IndivisualCreateFilePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$IndivisualCreateFilePayloadToJson(this);
}

@JsonSerializable()
class FilesModels {
  final String name;
  final String fileFullName;
  final String fileBytes;
  final int length;

  FilesModels({
    @required this.name,
    this.fileFullName,
    @required this.fileBytes,
    this.length,
  });

  factory FilesModels.fromJson(Map<String, dynamic> json) =>
      _$FilesModelsFromJson(json);

  Map<String, dynamic> toJson() => _$FilesModelsToJson(this);
}
