import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/data_item.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'company_data_viewmodel.dart';

class CompanyDataView extends StatelessWidget {
  const CompanyDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyDataViewModel>.reactive(
      viewModelBuilder: () => CompanyDataViewModel(),
      onModelReady: (viewModel) => viewModel.initilizeView(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
          ),
          centerTitle: true,
          title: FormTitle(
            title: 'بيانات الشركة',
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

class _DataView extends ViewModelWidget<CompanyDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompanyDataViewModel viewModel) {
    return PlatformScrollBar(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(
          top: 30.h,
          left: 30.w,
          right: 30.w,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 30.h),
            DataItem(
              label: 'إسم الشركة',
              value: viewModel?.companyData?.companyName ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'الغرفة التجارية',
              value: viewModel?.companyData?.chamberOfCommerce ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'السجل التجاري',
              value: viewModel?.companyData?.commercialNo ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'سجل المستوردين',
              value: viewModel?.companyData?.importersRecord ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'الرخصة التجارية',
              value: viewModel?.companyData?.licenseNumber ?? '',
            ),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}
