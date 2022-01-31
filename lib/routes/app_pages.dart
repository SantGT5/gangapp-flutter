import 'package:gangapp_flutter/ui/auth/screens/home_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/intro_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/loading_screen.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL_LOGGED = Routes.HOME;
  static const INITIAL_NOT_LOGGED = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
  ];
}
