import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app.locator.dart';
import 'app/app_config.dart';
import 'config/config.dart';
import 'main.dart';
import 'ui/setup_dialog_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
