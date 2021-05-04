// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndivisualBankAccount _$IndivisualBankAccountFromJson(
    Map<String, dynamic> json) {
  return IndivisualBankAccount(
    json['individualBankAccountId'] as String,
    json['accountNumber'] as String,
    json['branchNumber'] as String,
    json['isEditDisabled'] as bool,
  );
}

Map<String, dynamic> _$IndivisualBankAccountToJson(
        IndivisualBankAccount instance) =>
    <String, dynamic>{
      'individualBankAccountId': instance.individualBankAccountId,
      'accountNumber': instance.accountNumber,
      'branchNumber': instance.branchNumber,
      'isEditDisabled': instance.isEditDisabled,
    };
