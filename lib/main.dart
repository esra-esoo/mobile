import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/models/shared_refuse_state.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'app/app_config.dart';

import 'consts/styles.dart';
import 'models/user.dart';
import 'services/shared_service.dart';
import 'services/user_service.dart';
import 'ui/views/splash_screen/splash_screen_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: Size(414.0, 896.0),
      builder: () {
        return MultiProvider(
          providers: [
            StreamProvider<User>(
              create: (context) => locator<UserService>().userStream,
              initialData: User.initial(),
            ),
            StreamProvider<SharedRefuseState>(
              create: (context) =>
                  locator<SharedService>().sharedRefuseStateStream,
              initialData: SharedRefuseState.initial(),
            ),
          ],
          child: MaterialApp(
            title: AppConfig.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(brightness: Brightness.dark),
              primarySwatch: kMaterialColor,
              primaryColor: kcolorPrimaryBlue,
              accentColor: Colors.white,
              splashColor: kcolorPrimaryBlue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Cairo',
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [const Locale('ar'), const Locale('en')],
            locale: const Locale("LY"),
            initialRoute: Routes.splashScreenView,
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            home: SplashScreenView(),
          ),
        );
      },
    );
  }
}
