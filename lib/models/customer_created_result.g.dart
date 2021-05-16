// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_created_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCreatedResult _$CustomerCreatedResultFromJson(
    Map<String, dynamic> json) {
  return CustomerCreatedResult(
    json['phoneNumber'] as String?,
    json['password'] as String?,
  );
}

Map<String, dynamic> _$CustomerCreatedResultToJson(
        CustomerCreatedResult instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
