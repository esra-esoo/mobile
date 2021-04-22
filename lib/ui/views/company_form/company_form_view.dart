import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:stacked/stacked.dart';

import 'authorizers_form_view.dart';
import 'basic_form_view.dart';
import 'company_form_viewmodel.dart';

class CompanyView extends StatelessWidget {
  const CompanyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyViewModel>.reactive(
      viewModelBuilder: () => CompanyViewModel(),
      builder: (context, viewModel, child) => BusyOverlay(
        primaryColors: true,
        show: viewModel.isBusy,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => viewModel.currentIndex == 1
                  ? viewModel.setIndex(0)
                  : Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: kcolorPrimaryBlue),
            ),
            centerTitle: true,
            title: FormTitle(
              title: viewModel.currentIndex == 0
                  ? 'رفع مستندات الشركة'
                  : 'المخولين',
              color: kcolorPrimaryBlue,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 30.w,
              right: 30.w,
            ),
            child: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 300),
              reverse: viewModel.reverse,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  fillColor: Colors.transparent,
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                );
              },
              child: getViewForIndex(viewModel.currentIndex, context),
            ),
          ),
          bottomNavigationBar: BottomSubmitButton(
            label: viewModel.currentIndex == 0 ? 'التالي' : 'رفع المستندات',
            accentColors: false,
            onPressed: () async {
              if (viewModel.currentIndex == 0)
                viewModel.goNext();
              else
                await viewModel.saveData();
            },
          ),
        ),
      ),
    );
  }

  Widget getViewForIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        return BasicFormView();
        break;
      case 1:
        return AuthorizersFormView();
        break;
      default:
        return BasicFormView();
    }
  }
}
