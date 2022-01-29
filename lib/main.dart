import 'package:gangapp_flutter/auth/bindings/auth_binding.dart';
import 'package:gangapp_flutter/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gangapp_flutter/firebase_options.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
