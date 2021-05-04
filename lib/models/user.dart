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
  final String sub;

  const User({
    @required this.hasUploaded,
    @required this.customerType,
    @required this.phoneNumber,
    this.sub,
  });

  User.initial()
      : hasUploaded = false,
        customerType = null,
        sub = null,
        phoneNumber = null;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    List<dynamic> roles = decodedToken['role'] ?? [];
    String phoneNumber = decodedToken['given_name'] ?? null;
    String sub = decodedToken['sub'] ?? null;

    var role = roles.contains('Indivisual')
        ? AccountTypeEng.INDIVISUAL
        : AccountTypeEng.COMPANY;
    return User(
      phoneNumber: phoneNumber,
      customerType: role,
      hasUploaded: false,
      sub: sub,
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
