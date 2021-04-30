// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    phoneNumbaer: json['phoneNumbaer'] as String,
    role: json['role'] as String,
    sub: json['sub'] as String,
    editMode: json['editMode'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phoneNumbaer': instance.phoneNumbaer,
      'role': instance.role,
      'sub': instance.sub,
      'editMode': instance.editMode,
    };
