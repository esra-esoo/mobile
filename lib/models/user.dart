import 'package:flutter/material.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final bool hasUploaded;
  final String customerType;
  final String phoneNumber;

  const User({
    @required this.hasUploaded,
    @required this.customerType,
    @required this.phoneNumber,
  });

  User.initial()
      : hasUploaded = false,
        customerType = null,
        phoneNumber = null;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    List<dynamic> roles = decodedToken['role'] ?? [];
    String phoneNumber = decodedToken['given_name'] ?? null;

    var role = roles.contains('Indivisual')
        ? AccountTypeEng.INDIVISUAL
        : AccountTypeEng.COMPANY;
    return User(
      phoneNumber: phoneNumber,
      customerType: role,
      hasUploaded: false,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
