import 'package:flutter/material.dart';
import 'package:huayati/consts/account_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String role;
  final bool editMode;

  const User({
    @required this.role,
    this.editMode = false,
  });

  User.initial()
      : role = null,
        editMode = false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    List<dynamic> roles = decodedToken['role'] ?? [];

    var role = roles.contains('Indivisual')
        ? AccountType.INDIVISUAL
        : AccountType.COMPANY;
    return User(editMode: false, role: role);
  }
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
