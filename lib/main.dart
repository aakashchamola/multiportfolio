// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/routes/app_routes.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Multi-Platform Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, platform: defaultTargetPlatform),
      initialRoute: Routes.home,
      getPages: AppRoutes.routes,
    );
  }
}
