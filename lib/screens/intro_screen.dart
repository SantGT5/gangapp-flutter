import 'package:flutter/material.dart';
import 'package:gangapp_flutter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await authController.signInGoogle();
        },
      ),
      body: Center(
        child: Text("Intro Screen"),
      ),
    );
  }
}
