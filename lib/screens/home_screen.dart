import 'package:flutter/material.dart';
import 'package:gangapp_flutter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await authController.signOut();
        },
      ),
      body: Center(
        child: Text("Esto Gangapp"),
      ),
    );
  }
}
