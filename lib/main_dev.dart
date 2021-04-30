import 'package:flutter/material.dart';

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
    child: MyApp(),
  );
  setupLocator(endpoint: 'https://mobile.tatweer.ly:44356');
  runApp(configuredApp);
}
