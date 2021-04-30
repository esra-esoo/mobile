import 'package:flutter/material.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String phoneNumbaer;
  final String role;
  final String sub;
  final bool editMode;

  const User({
    @required this.phoneNumbaer,
    @required this.role,
    @required this.sub,
    this.editMode = false,
  });

  User.initial()
      : phoneNumbaer = null,
        role = null,
        sub = null,
        editMode = false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    List<dynamic> roles = decodedToken['role'] ?? [];
    String phoneNumber = decodedToken['given_name'] ?? null;
    String sub = decodedToken['sub'] ?? null;

    var role = roles.contains('Indivisual')
        ? AccountType.INDIVISUAL
        : AccountType.COMPANY;
    return User(
      phoneNumbaer: phoneNumber,
      role: role,
      sub: sub,
      editMode: false,
    );
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
