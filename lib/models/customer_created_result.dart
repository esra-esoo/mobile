import 'package:json_annotation/json_annotation.dart';

part 'customer_created_result.g.dart';

@JsonSerializable(explicitToJson: false)
class CustomerCreatedResult {
  final String phoneNumber;
  final String password;

  const CustomerCreatedResult(
    this.phoneNumber,
    this.password,
  );

  factory CustomerCreatedResult.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreatedResultFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerCreatedResultToJson(this);
}
