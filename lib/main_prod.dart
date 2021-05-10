import 'package:flutter/material.dart';
import 'app/app_config.dart';
import 'app/locator.dart';
import 'config/config.dart';
import 'main.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var configuredApp = AppConfig(
    appTitle: "هويتي",
    buildFlavor: "Production",
    isDevEnviroment: false,
    authEndpoint: Config.prodAuthEndpoint,
    endpoint: Config.prodEndpoint,
    child: MyApp(),
  );
  setupLocator();
  return runApp(configuredApp);
}
