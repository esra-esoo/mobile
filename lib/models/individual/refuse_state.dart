import 'package:json_annotation/json_annotation.dart';

part 'refuse_state.g.dart';

@JsonSerializable()
class IndivisualRefuseState {
  final int? numberOfFiles;
  final String? message;
  final String? refuseType;
  final List<String>? files;

  const IndivisualRefuseState(
    this.numberOfFiles,
    this.message,
    this.refuseType,
    this.files,
  );

  IndivisualRefuseState.initial()
      : numberOfFiles = 0,
        message = null,
        refuseType = null,
        files = null;

  factory IndivisualRefuseState.fromJson(Map<String, dynamic> json) =>
      _$IndivisualRefuseStateFromJson(json);

  Map<String, dynamic> toJson() => _$IndivisualRefuseStateToJson(this);
}
