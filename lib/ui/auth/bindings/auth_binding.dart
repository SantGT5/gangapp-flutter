import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:gangapp_flutter/ui/home/controllers/nav_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
