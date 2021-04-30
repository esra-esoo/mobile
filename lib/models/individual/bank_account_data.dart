import 'package:json_annotation/json_annotation.dart';

part 'bank_account_data.g.dart';

@JsonSerializable()
class BankAccountData {
  final String individualBankAccountId;
  final String accountNumber;
  final String branchNumber;
  final bool isEditDisabled;

  const BankAccountData(
    this.individualBankAccountId,
    this.accountNumber,
    this.branchNumber,
    this.isEditDisabled,
  );

  factory BankAccountData.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountDataToJson(this);
}
