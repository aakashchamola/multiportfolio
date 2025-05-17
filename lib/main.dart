// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/data/firebase_remote_service.dart';
import 'package:multiportfolio/features/controllers/portfolio_controller.dart';
import 'package:multiportfolio/features/screens/main_screen.dart';
import 'package:multiportfolio/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseRemoteService firebaseService = FirebaseRemoteService();
  await firebaseService.initialize();
  runApp(const MyApp());

  // Get.put(PortfolioController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MultiPlatform Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(PortfolioController());
      }),
      home: const MainScreen(),
    );
  }
}
