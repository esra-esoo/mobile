import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/animations/fade_bottom_animation.dart';
import 'package:huayati/ui/animations/scale_animation.dart';
import 'package:huayati/ui/widgets/full_logo.dart';
import 'package:huayati/ui/widgets/jbank_logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.initializeView(),
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcolorPrimaryBlue,
        body: Center(
          child: Column(
            children: <Widget>[
              const Spacer(),
              CustomScaleAnimation(
                order: 1,
                curve: Curves.fastOutSlowIn,
                duration: 400,
                child: Hero(tag: 'logo', child: FullLogo(height: 220.w)),
              ),
              const Spacer(),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 3,
              //   child: const LinearProgressIndicator(
              //     backgroundColor: kcolorBluelight,
              //   ),
              // ),
              FadeFromBottomAnimation(
                duration: 300,
                order: 1.5,
                child: SafeArea(
                  minimum: EdgeInsets.only(
                    top: getValueForScreenType<double>(
                        context: context, mobile: 20, tablet: 30),
                    bottom: getValueForScreenType<double>(
                        context: context, mobile: 20, tablet: 30),
                  ),
                  bottom: true,
                  child: const JbankLogo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
