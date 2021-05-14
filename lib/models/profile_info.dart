import 'package:json_annotation/json_annotation.dart';

part 'profile_info.g.dart';

@JsonSerializable(explicitToJson: false)
class ProfileInfo {
  final String? username;
  final String? fullname;
  final String? familyName;
  final String? email;
  final String? phoneNumber;

  const ProfileInfo({
    this.username,
    this.fullname,
    this.familyName,
    this.email,
    this.phoneNumber,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileInfoToJson(this);
}
