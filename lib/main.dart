import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/app_config.dart';
import 'app/locator.dart';

import 'app/router.gr.dart';
import 'consts/styles.dart';
import 'services/third_party/navigation_service.dart';
import 'ui/views/splash_screen/splash_screen_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
      designSize: Size(414.0, 896.0),
      allowFontScaling: false,
      builder: () {
        return MaterialApp(
          title: AppConfig.of(context).appTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: kMaterialColor,
            primaryColor: kcolorPrimaryBlue,
            accentColor: Colors.white,
            splashColor: kcolorPrimaryBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Cairo',
          ),
          initialRoute: Routes.splashScreenView,
          onGenerateRoute: Router().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          home: SplashScreenView(),
        );
      },
    );
  }
}
