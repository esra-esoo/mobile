import 'package:json_annotation/json_annotation.dart';

import '../file_models.dart';

part 'indivisual_create_files_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class IndivisualCreateFilesPayload {
  final String? phoneNumber;
  final List<FilesModels>? filesModels;
  final int? length;

  const IndivisualCreateFilesPayload({
    required this.phoneNumber,
    required this.filesModels,
    this.length,
  });

  factory IndivisualCreateFilesPayload.fromJson(Map<String, dynamic> json) =>
      _$IndivisualCreateFilesPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$IndivisualCreateFilesPayloadToJson(this);
}
