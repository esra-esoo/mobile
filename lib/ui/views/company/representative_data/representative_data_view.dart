import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/representative/representative_data.dart';
import 'package:huayati/ui/widgets/data_item.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'representative_data_viewmodel.dart';

class RepresentativeDataView extends StatelessWidget {
  const RepresentativeDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RepresentativeDataViewModel>.reactive(
      viewModelBuilder: () => RepresentativeDataViewModel(),
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
            title: 'بيانات المخولين',
            color: kcolorPrimaryBlue,
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 375),
          child: viewModel.isBusy
              ? const CenterLoadingIndicator()
              : viewModel.representativeDataList.length > 0
                  ? const _DataView()
                  : const _RefreshView(),
        ),
      ),
    );
  }
}

class _RefreshView extends ViewModelWidget<RepresentativeDataViewModel> {
  const _RefreshView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, RepresentativeDataViewModel viewModel) {
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

class _DataView extends ViewModelWidget<RepresentativeDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, RepresentativeDataViewModel viewModel) {
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
          itemCount: viewModel?.representativeDataList?.length,
          itemBuilder: (context, index) {
            return _RepresentativeItemCard(
              representativeData: viewModel?.representativeDataList[index],
              isFirst: index == 0,
            );
          },
        ),
      ),
    );
  }
}

class _RepresentativeItemCard extends StatelessWidget {
  final RepresentativeData representativeData;
  final bool isFirst;
  const _RepresentativeItemCard({
    Key key,
    @required this.representativeData,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return representativeData != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                isFirst ? 'بياناتك' : 'المخول الاخر',
                style: TextStyle(
                  color: kcolorBluelight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                  border: Border.all(
                      color: kcolorBluelight.withOpacity(0.3), width: 2),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    DataItem(
                      label: 'الاسم بالعربي',
                      value: representativeData.nameInArabic ?? '',
                    ),
                    SizedBox(height: 25.h),
                    DataItem(
                      label: 'الاسم بالانجليزي',
                      value: representativeData.nameInEnglish ?? '',
                    ),
                    SizedBox(height: 25.h),
                    DataItem(
                      label: 'الرقم الوطني',
                      value: representativeData.idNumber ?? '',
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
