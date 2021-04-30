import 'package:flutter/material.dart';
import 'app/app_config.dart';
import 'app/locator.dart';
import 'main.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var configuredApp = AppConfig(
    appTitle: "هويتي",
    buildFlavor: "Production",
    isDevEnviroment: false,
    child: MyApp(),
  );
  setupLocator(endpoint: 'https://mobile.tatweer.ly:44356');
  return runApp(configuredApp);
}
