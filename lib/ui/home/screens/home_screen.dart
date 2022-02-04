import 'package:flutter/material.dart';
import 'package:gangapp_flutter/global_widgets/navigation/custom_navigation_bar.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:gangapp_flutter/ui/home/controllers/nav_controller.dart';
import 'package:gangapp_flutter/ui/profile/screens/profile_screen.dart';
import 'package:gangapp_flutter/ui/proof/screens/page1.dart';
import 'package:gangapp_flutter/ui/proof/screens/page2.dart';
import 'package:gangapp_flutter/ui/proof/screens/page3.dart';
import 'package:gangapp_flutter/ui/proof/screens/page4.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    var screens = [
      Page1(),
      Page2(),
      Page3(),
      ProfileScreen(),
    ];

    AuthController authController = AuthController();

    // AuthController authController = Get.find();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex: navController.index.value,
          onIndexChanged: (i) {
            navController.index.value = i;
          },
        ),
        body: screens[navController.index.value],
      ),
    );
  }
}
