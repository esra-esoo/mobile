import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/botton_padding.dart';
import 'package:huayati/ui/widgets/data_item.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:huayati/ui/widgets/scrollbar.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';
import 'widgets/update_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ViewModelBuilder<ProfileViewModel>.reactive(
        disposeViewModel: false,
        fireOnModelReadyOnce: true,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => locator<ProfileViewModel>(),
        onModelReady: (viewModel) => viewModel.initilizeView(),
        builder: (context, viewModel, child) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 375),
          child: viewModel.isBusy
              ? const CenterLoadingIndicator()
              : viewModel.profileInfo == null
                  ? const _RefreshView()
                  : const _DataView(),
        ),
      ),
    );
  }
}

class _DataView extends ViewModelWidget<ProfileViewModel> {
  const _DataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return PlatformScrollBar(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(
          top: 30.h,
          left: 30.w,
          right: 30.w,
        ),
        child: RefreshIndicator(
          backgroundColor: kcolorPrimaryBlue,
          color: Colors.white,
          onRefresh: () => viewModel.initilizeView(),
          child: ListView(
            shrinkWrap: true,
            children: [
              DataItem(
                label: 'رقم الهاتف',
                value: viewModel?.profileInfo?.phoneNumber ?? '',
              ),
              SizedBox(height: 20.h),
              DataItem(
                label: 'اسم المستخدم',
                value: viewModel?.profileInfo?.username ?? '',
              ),
              SizedBox(height: 20.h),
              DataItem(
                label: 'الاسم كامل',
                value: viewModel?.profileInfo?.fullname ?? '',
              ),
              SizedBox(height: 20.h),
              DataItem(
                label: 'اللقب',
                value: viewModel?.profileInfo?.familyName ?? '',
              ),
              SizedBox(height: 20.h),
              DataItem(
                label: 'البريد الإلكتروني',
                value: viewModel?.profileInfo?.email ?? '',
              ),
              SizedBox(height: 20.h),
              const UpdateProfileButton(),
              const BottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RefreshView extends ViewModelWidget<ProfileViewModel> {
  const _RefreshView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return RefreshIndicator(
      backgroundColor: kcolorPrimaryBlue,
      color: Colors.white,
      onRefresh: () => viewModel.initilizeView(),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight - 120,
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
