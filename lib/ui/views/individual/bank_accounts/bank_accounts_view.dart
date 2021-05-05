import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/bank_item.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'bank_accounts_viewmodel.dart';

class IndividualBankAccountsDataView extends StatelessWidget {
  const IndividualBankAccountsDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualBankAccountsDataViewModel>.reactive(
      viewModelBuilder: () => IndividualBankAccountsDataViewModel(),
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
            title: 'بيانات الحساب',
            color: kcolorPrimaryBlue,
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 375),
          child: viewModel.isBusy
              ? const CenterLoadingIndicator()
              : viewModel.indivisualBankAccount.length > 0
                  ? const _DataView()
                  : const _RefreshView(),
        ),
      ),
    );
  }
}

class _DataView extends ViewModelWidget<IndividualBankAccountsDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, IndividualBankAccountsDataViewModel viewModel) {
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
          itemCount: viewModel?.indivisualBankAccount?.length,
          itemBuilder: (context, index) {
            return BankItem(
              accountNumber:
                  viewModel?.indivisualBankAccount[index]?.accountNumber,
              branchNumber:
                  viewModel?.indivisualBankAccount[index]?.branchNumber,
              no: index + 1,
            );
          },
        ),
      ),
    );
  }
}

class _RefreshView
    extends ViewModelWidget<IndividualBankAccountsDataViewModel> {
  const _RefreshView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, IndividualBankAccountsDataViewModel viewModel) {
    return RefreshIndicator(
      backgroundColor: kcolorPrimaryBlue,
      color: Colors.white,
      onRefresh: () => viewModel.initilizeView(),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            alignment: Alignment.center,
            child: Text(
              'لايوجد بيانات, قم بسحب الصفحة لاسفل لتحديثها.',
              style: const TextStyle(
                color: Colors.black,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
