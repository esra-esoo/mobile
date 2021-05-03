import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'bank_account_viewmodel.dart';
import 'widgets/bank_item.dart';

class IndividualBankAccountDataView extends StatelessWidget {
  const IndividualBankAccountDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualBankAccountDataViewModel>.reactive(
      viewModelBuilder: () => IndividualBankAccountDataViewModel(),
      onModelReady: (viewModel) => viewModel.initilizeView(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
          ),
          centerTitle: true,
          title: FormTitle(
            title: 'البيانات الشخصية',
            color: kcolorPrimaryBlue,
          ),
        ),
        body: viewModel.isBusy ? const _LoadingIndicator() : const _DataView(),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: const LoadingIndicator());
  }
}

class _DataView extends ViewModelWidget<IndividualBankAccountDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, IndividualBankAccountDataViewModel viewModel) {
    return PlatformScrollBar(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
          padding: EdgeInsets.only(
            top: 30.h,
            left: 20.w,
            right: 20.w,
            bottom: kBottomNavigationBarHeight +
                MediaQuery.of(context).viewPadding.bottom,
          ),
          shrinkWrap: true,
          itemCount: viewModel?.bankAccountData?.length,
          itemBuilder: (context, index) {
            return BankItem(
              bankAccountData: viewModel?.bankAccountData[index],
              no: index + 1,
            );
          },
        ),
      ),
    );
  }
}
