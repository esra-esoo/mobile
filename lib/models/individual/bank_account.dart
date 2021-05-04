import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable()
class IndivisualBankAccount {
  final String individualBankAccountId;
  final String accountNumber;
  final String branchNumber;
  final bool isEditDisabled;

  const IndivisualBankAccount(
    this.individualBankAccountId,
    this.accountNumber,
    this.branchNumber,
    this.isEditDisabled,
  );

  factory IndivisualBankAccount.fromJson(Map<String, dynamic> json) =>
      _$IndivisualBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$IndivisualBankAccountToJson(this);
}
