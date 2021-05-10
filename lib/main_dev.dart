import 'package:flutter/material.dart';
import 'package:huayati/config/config.dart';

import 'app/app_config.dart';
import 'app/locator.dart';
import 'main.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var configuredApp = AppConfig(
    appTitle: "هويتي.DEV",
    buildFlavor: "Development",
    isDevEnviroment: true,
    authEndpoint: Config.devAuthEndpoint,
    endpoint: Config.devEndpoint,
    child: MyApp(),
  );
  setupLocator();
  runApp(configuredApp);
}
