import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
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
