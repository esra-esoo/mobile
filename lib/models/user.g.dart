// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    hasUploaded: json['hasUploaded'] as bool,
    customerType: json['customerType'] as String,
    phoneNumber: json['phoneNumber'] as String,
    sub: json['sub'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'hasUploaded': instance.hasUploaded,
      'customerType': instance.customerType,
      'phoneNumber': instance.phoneNumber,
      'sub': instance.sub,
    };
