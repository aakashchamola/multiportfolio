import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Sizing {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isWeb() => kIsWeb;
  static bool isMobile(BuildContext context) =>
      screenWidth(context) < 600 && !kIsWeb;
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1024 && !kIsWeb;
  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= 1024 || kIsWeb;

  static double adaptivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }
}
