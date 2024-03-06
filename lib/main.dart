import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_foot_admin/controller/home_controller.dart';
import 'package:new_foot_admin/controller/order_controller.dart';

import 'package:new_foot_admin/firebase_options.dart';
import 'package:new_foot_admin/pages/home_page.dart';

// Platform  Firebase App Id
// android   1:666207197593:android:c6705eda89d0c2d57ddb08

// model generator
// flutter pub run build_runner build --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(HomeController());
  Get.put(OrderController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Foot Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
