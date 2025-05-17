import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/features/screens/education_screen.dart';
import 'package:multiportfolio/features/screens/experience_screen.dart';
import 'package:multiportfolio/features/screens/home_screen.dart';
import 'package:multiportfolio/features/screens/profile_screen.dart';
import 'package:multiportfolio/features/screens/projects_screen.dart';
import 'package:multiportfolio/features/screens/skills_screen.dart';
import 'package:multiportfolio/features/wIdgets/custom_page_transition.dart';

class Routes {
  static const home = '/';
  static const profile = '/profile';
  static const experience = '/experience';
  static const education = '/education';
  static const skills = '/skills';
  static const projects = '/projects';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.left),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.left),
    ),
    GetPage(
      name: Routes.experience,
      page: () => const ExperienceScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.up),
    ),
    GetPage(
      name: Routes.education,
      page: () => const EducationScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.right),
    ),
    GetPage(
      name: Routes.skills,
      page: () => const SkillsScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.down),
    ),
    GetPage(
      name: Routes.projects,
      page: () => const ProjectsScreen(),
      customTransition: CustomPageTransition(direction: AxisDirection.left),
    ),
  ];
}
