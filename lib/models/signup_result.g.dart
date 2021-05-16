// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResult _$SignUpResultFromJson(Map<String, dynamic> json) {
  return SignUpResult(
    json['verificationCode'] as int?,
    json['phoneNumber'] as String?,
    json['verificationCodeEndDateTime'] == null
        ? null
        : DateTime.parse(json['verificationCodeEndDateTime'] as String),
  );
}

Map<String, dynamic> _$SignUpResultToJson(SignUpResult instance) =>
    <String, dynamic>{
      'verificationCode': instance.verificationCode,
      'phoneNumber': instance.phoneNumber,
      'verificationCodeEndDateTime':
          instance.verificationCodeEndDateTime?.toIso8601String(),
    };
