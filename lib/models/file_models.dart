
import 'package:json_annotation/json_annotation.dart';

part 'file_models.g.dart';

@JsonSerializable()
class FilesModels {
  final String? name;
  final String? fileFullName;
  final String? fileBytes;
  final int? length;

  FilesModels({
    required this.name,
    this.fileFullName,
    required this.fileBytes,
    this.length,
  });

  factory FilesModels.fromJson(Map<String, dynamic> json) =>
      _$FilesModelsFromJson(json);

  Map<String, dynamic> toJson() => _$FilesModelsToJson(this);
}
