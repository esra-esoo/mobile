import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:huayati/ui/views/splash_screen/splash_screen_view.dart';
import 'package:huayati/ui/views/startup/startup_view.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: SplashScreenView, initial: true),
  CustomRoute(
    page: StartUpView,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 500,
  ),
])
class $Router {}
