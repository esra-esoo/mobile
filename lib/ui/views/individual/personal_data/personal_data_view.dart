import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/data_item.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'personal_data_viewmodel.dart';

class IndividualPersonalDataView extends StatelessWidget {
  const IndividualPersonalDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndividualPersonalDataViewModel>.reactive(
      viewModelBuilder: () => IndividualPersonalDataViewModel(),
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
        body: viewModel.isBusy
            ? const CenterLoadingIndicator()
            : const _DataView(),
      ),
    );
  }
}

class _DataView extends ViewModelWidget<IndividualPersonalDataViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(
      BuildContext context, IndividualPersonalDataViewModel viewModel) {
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
              label: 'الإسم بالعربي',
              value: viewModel?.personalData?.nameInArabic ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'الإسم بالانجليزي',
              value: viewModel?.personalData?.nameInEnglish ?? '',
            ),
            SizedBox(height: 25.h),
            DataItem(
              label: 'الرقم الوطني',
              value: viewModel?.personalData?.idNumber ?? '',
            ),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}
