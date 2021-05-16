import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable()
class CompanyBankAccount {
  final String? companyBankAccountId;
  final String? accountNumber;
  final String? branchNumber;
  final bool? isEditDisabled;

  const CompanyBankAccount(
    this.companyBankAccountId,
    this.accountNumber,
    this.branchNumber,
    this.isEditDisabled,
  );

  factory CompanyBankAccount.fromJson(Map<String, dynamic> json) =>
      _$CompanyBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyBankAccountToJson(this);
}
