// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBankAccount _$CompanyBankAccountFromJson(Map<String, dynamic> json) {
  return CompanyBankAccount(
    json['companyBankAccountId'] as String?,
    json['accountNumber'] as String?,
    json['branchNumber'] as String?,
    json['isEditDisabled'] as bool?,
  );
}

Map<String, dynamic> _$CompanyBankAccountToJson(CompanyBankAccount instance) =>
    <String, dynamic>{
      'companyBankAccountId': instance.companyBankAccountId,
      'accountNumber': instance.accountNumber,
      'branchNumber': instance.branchNumber,
      'isEditDisabled': instance.isEditDisabled,
    };
