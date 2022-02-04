import 'package:flutter/material.dart';
import 'package:gangapp_flutter/routes/app_pages.dart';
import 'package:gangapp_flutter/ui/theme/color_theme.dart';
import 'package:get/get.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.PRODUCTFORM);
        },
      ),
      body: Center(
        child: Text("Home Product"),
      ),
    );
  }
}
