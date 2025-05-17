import 'package:flutter/material.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/screens/certification_screen.dart';
import 'package:multiportfolio/features/screens/education_screen.dart';
import 'package:multiportfolio/features/screens/experience_screen.dart';
import 'package:multiportfolio/features/screens/home_screen.dart';
import 'package:multiportfolio/features/screens/profile_screen.dart';
import 'package:multiportfolio/features/screens/projects_screen.dart';
import 'package:multiportfolio/features/screens/skills_screen.dart';
import 'package:multiportfolio/features/wIdgets/navigation_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(),
    ExperienceScreen(),
    EducationScreen(),
    CertificationScreen(),
    SkillsScreen(),
    ProjectsScreen(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobileApp = Sizing.isMobileApp();
    bool isMobile = Sizing.isMobile(context);

    return Scaffold(
      body: Row(
        children: [
          if (!isMobile || (Sizing.isDesktop(context) && !isMobileApp))
            NavigationWidget(
              selectedIndex: _selectedIndex,
              onItemSelected: _onNavTap,
            ),
          Expanded(child: _screens[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: (isMobile || isMobileApp)
          ? NavigationWidget(
              selectedIndex: _selectedIndex,
              onItemSelected: _onNavTap,
            )
          : null,
    );
  }
}
