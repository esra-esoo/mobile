import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/data_item.dart';

class BankItem extends StatelessWidget {
  final int no;
  final String? accountNumber;
  final String? branchNumber;
  const BankItem({
    Key? key,
    required this.no,
    required this.accountNumber,
    required this.branchNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                value: accountNumber ?? '',
              ),
              SizedBox(height: 25.h),
              DataItem(
                label: 'رقم الفرع',
                value: branchNumber ?? '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
