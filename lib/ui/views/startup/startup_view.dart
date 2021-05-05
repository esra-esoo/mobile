import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/ui/views/home/home_view.dart';
import 'package:huayati/ui/views/profile/profile_view.dart';
import 'package:huayati/ui/widgets/bottom_navigation_bar.dart';
import 'package:huayati/ui/widgets/side_drawer.dart';
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
    final _scaffoldKey = GlobalKey<ScaffoldState>();

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
            key: _scaffoldKey,
            drawer: const SideDrawer(),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
              title: Text(
                getTitle(model.currentIndex),
                style: const TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
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
              child: getViewForIndex(model.currentIndex),
            ),
            bottomNavigationBar: AppBottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
            ),
          );
        });
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView();
        break;
      case 2:
        return ProfileView();
        break;
      default:
        return HomeView();
    }
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'الرئيسية';
        break;
      case 2:
        return 'الملف الشخصي';
        break;
      default:
        return 'الرئيسية';
    }
  }
}
