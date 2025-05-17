import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import '../../features/controllers/portfolio_controller.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    List<String> skills = controller.portfolioData.value!.skills;
    double padding = Sizing.adaptivePadding(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skills',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimationLimiter(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => ScaleAnimation(
                child: FadeInAnimation(child: widget),
              ),
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizing.isDesktop(context)
                            ? 24
                            : Sizing.isTablet(context)
                                ? 18
                                : 16,
                      )),
                  backgroundColor: const Color(0xFF02897C),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
