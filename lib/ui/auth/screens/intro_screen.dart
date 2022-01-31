import 'package:flutter/material.dart';
import 'package:gangapp_flutter/ui/auth/controllers/auth_controller.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:gangapp_flutter/ui/theme/gangapp_icons.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await authController.signInGoogle();
        },
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: AppColors.secondary[200],
          child: Icon(GangappIcons.search_product),
        ),
      ),
    );
  }
}
