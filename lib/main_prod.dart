import 'package:flutter/material.dart';
import 'app/app.locator.dart';
import 'app/app_config.dart';
import 'config/config.dart';
import 'main.dart';
import 'ui/setup_dialog_ui.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  var configuredApp = AppConfig(
    MyApp(),
    appTitle: "هويتي",
    buildFlavor: "Production",
    isDevEnviroment: false,
    authEndpoint: Config.prodAuthEndpoint,
    endpoint: Config.prodEndpoint,
  );
  setupLocator();
  setupDialogUi();
  return runApp(configuredApp);
}
