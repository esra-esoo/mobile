import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../file_models.dart';

part 'indivisual_create_files_payload.g.dart';

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
