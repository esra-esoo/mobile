import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/bank_item.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'bank_account_viewmodel.dart';

class CompanyBankAccountsDataView extends StatelessWidget {
  const CompanyBankAccountsDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyBankAccountsDataViewModel>.reactive(
      viewModelBuilder: () => CompanyBankAccountsDataViewModel(),
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
              : viewModel.companyBankAccounts.length > 0
                  ? const _DataView()
                  : const _RefreshView(),
        ),
      ),
    );
  }
}

class _DataView extends ViewModelWidget<CompanyBankAccountsDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, CompanyBankAccountsDataViewModel viewModel) {
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
          itemCount: viewModel?.companyBankAccounts?.length,
          itemBuilder: (context, index) {
            return BankItem(
              accountNumber:
                  viewModel?.companyBankAccounts[index]?.accountNumber,
              branchNumber: viewModel?.companyBankAccounts[index]?.branchNumber,
              no: index + 1,
            );
          },
        ),
      ),
    );
  }
}

class _RefreshView extends ViewModelWidget<CompanyBankAccountsDataViewModel> {
  const _RefreshView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, CompanyBankAccountsDataViewModel viewModel) {
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
