import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gangapp_flutter/firebase_options.dart';
import 'package:gangapp_flutter/screens/loading_screen.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put<AuthController>(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: LoadingScreen(),
    );
  }
}
