import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/individual/bank_account_data.dart';
import 'package:huayati/ui/widgets/data_item.dart';

class BankItem extends StatelessWidget {
  final int no;
  final BankAccountData bankAccountData;
  const BankItem({
    Key key,
    @required this.bankAccountData,
    @required this.no,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bankAccountData == null)
      return SizedBox.shrink();
    else
      return Column(
        children: [
          Text(
            'حساب رقم $no',
            style: TextStyle(
              color: kcolorBluelight,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(15.0)),
              border:
                  Border.all(color: kcolorBluelight.withOpacity(0.3), width: 2),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 15),
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
          ),
        ],
      );
  }
}
