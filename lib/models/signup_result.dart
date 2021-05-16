import 'package:json_annotation/json_annotation.dart';

part 'signup_result.g.dart';

@JsonSerializable(explicitToJson: false)
class SignUpResult {
  final int? verificationCode;
  final String? phoneNumber;
  final DateTime? verificationCodeEndDateTime;

  const SignUpResult(
    this.verificationCode,
    this.phoneNumber,
    this.verificationCodeEndDateTime,
  );

  factory SignUpResult.fromJson(Map<String, dynamic> json) =>
      _$SignUpResultFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResultToJson(this);
}
