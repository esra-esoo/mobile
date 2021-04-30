import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/models/individual/bank_account_data.dart';
import 'package:huayati/ui/widgets/data_item.dart';

class BankItem extends StatelessWidget {
  final BankAccountData bankAccountData;
  const BankItem({Key key, @required this.bankAccountData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bankAccountData == null)
      return SizedBox.shrink();
    else
      return Container(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            DataItem(
              label: 'رقم الحساب',
              value: bankAccountData?.accountNumber ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'رقم الفرع',
              value: bankAccountData?.branchNumber ?? '',
            ),
          ],
        ),
      );
  }
}
