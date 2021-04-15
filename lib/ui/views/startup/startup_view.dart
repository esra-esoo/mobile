import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/ui/widgets/bottom_navigation_bar.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => locator<StartUpViewModel>(),
        onModelReady: (viewModel) async {
          SchedulerBinding.instance.addPostFrameCallback(
            (duration) async {
              await viewModel.initializeView();
            },
          );
        },
        disposeViewModel: false,
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 300),
              reverse: model.reverse,
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
              child: getViewForIndex(model.currentIndex, context),
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
            ),
          );
        });
  }

  Widget getViewForIndex(int index, BuildContext context) {
    switch (index) {
      default:
        return Container(
          child: Text('home'),
        );
    }
  }
}
