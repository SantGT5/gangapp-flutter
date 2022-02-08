import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gangapp_flutter/services/firebase_config/firebase_options.dart';

import 'routes/app_pages.dart';
import 'ui/auth/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      initialRoute: '/loading',
      initialBinding: BindingsBuilder(
        () {
          Get.put<AuthController>(AuthController());
        },
      ), //AuthBinding(), //Routes.LOADING
      getPages: AppPages.routes,
    );
  }
}
