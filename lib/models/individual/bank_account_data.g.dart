// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountData _$BankAccountDataFromJson(Map<String, dynamic> json) {
  return BankAccountData(
    json['individualBankAccountId'] as String,
    json['accountNumber'] as String,
    json['branchNumber'] as String,
    json['isEditDisabled'] as bool,
  );
}

Map<String, dynamic> _$BankAccountDataToJson(BankAccountData instance) =>
    <String, dynamic>{
      'individualBankAccountId': instance.individualBankAccountId,
      'accountNumber': instance.accountNumber,
      'branchNumber': instance.branchNumber,
      'isEditDisabled': instance.isEditDisabled,
    };
