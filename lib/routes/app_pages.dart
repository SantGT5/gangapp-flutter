import 'package:gangapp_flutter/ui/chat/bindings/message_binding.dart';
import 'package:gangapp_flutter/ui/chat/screens/chat_screen.dart';
import 'package:gangapp_flutter/ui/home/bindings/nav_binding.dart';
import 'package:gangapp_flutter/ui/home/screens/home_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/intro_screen.dart';
import 'package:gangapp_flutter/ui/auth/screens/loading_screen.dart';
import 'package:gangapp_flutter/ui/products/bindings/product_binding.dart';
import 'package:gangapp_flutter/ui/products/bindings/product_edit_binding.dart';
import 'package:gangapp_flutter/ui/products/screens/product_form.dart';
import 'package:gangapp_flutter/ui/proof/bindings/product_proof_binding.dart';
import 'package:gangapp_flutter/ui/video/bindings/video_binding.dart';
import 'package:gangapp_flutter/ui/video/bindings/videos_edit_binding.dart';
import 'package:gangapp_flutter/ui/video/screens/video_details_screen.dart';
import 'package:gangapp_flutter/ui/video/screens/videos_form.dart';
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
      bindings: [
        NavBinding(),
        ProductBinding(),
        VideoBinding(),
        ProductProofBinding(),
      ],
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.PRODUCTFORM,
      page: () => ProductForm(),
      binding: ProductEditBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: Routes.VIDEOSFORM,
      page: () => VideosForm(),
      binding: VideosEditBinding(),
    ),
    GetPage(
      name: Routes.VIDEODETAILS,
      page: () => VideoDetailsScreen(),
    ),
  ];
}
