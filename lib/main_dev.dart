import 'package:flutter/material.dart';
import 'package:huayati/config/config.dart';

import 'app/app.locator.dart';
import 'app/app_config.dart';
import 'main.dart';
import 'ui/setup_dialog_ui.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var configuredApp = AppConfig(
    MyApp(),
    appTitle: "هويتي.DEV",
    buildFlavor: "Development",
    isDevEnviroment: true,
    authEndpoint: Config.devAuthEndpoint,
    endpoint: Config.devEndpoint,
  );
  setupLocator();
  setupDialogUi();
  runApp(configuredApp);
}
