import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huayati/config/config.dart';

import 'app/app.locator.dart';
import 'app/app_config.dart';
import 'main.dart';
import 'ui/setup_dialog_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
