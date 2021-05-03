import 'package:json_annotation/json_annotation.dart';

part 'refuse_message.g.dart';

@JsonSerializable(explicitToJson: false)
class RefuseMessage {
  final int numberOfFiles;
  final String message;
  final String refuseType;
  final List<String> files;

  const RefuseMessage(
    this.numberOfFiles,
    this.message,
    this.refuseType,
    this.files,
  );

  RefuseMessage.initial()
      : numberOfFiles = 0,
        message = null,
        refuseType = null,
        files = null;

  factory RefuseMessage.fromJson(Map<String, dynamic> json) =>
      _$RefuseMessageFromJson(json);

  Map<String, dynamic> toJson() => _$RefuseMessageToJson(this);
}
