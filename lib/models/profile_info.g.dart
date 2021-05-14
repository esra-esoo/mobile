// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) {
  return ProfileInfo(
    username: json['username'] as String?,
    fullname: json['fullname'] as String?,
    familyName: json['familyName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      'username': instance.username,
      'fullname': instance.fullname,
      'familyName': instance.familyName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
