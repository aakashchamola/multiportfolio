import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/controllers/portfolio_controller.dart';
import 'package:multiportfolio/features/models/portfolio_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = Sizing.adaptivePadding(context);
    final controller = Get.find<PortfolioController>();
    Portfolio portfolio = controller.portfolioData.value!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: AnimationLimiter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  Text(
                    portfolio.title,
                    style: TextStyle(
                      fontSize: Sizing.isDesktop(context)
                          ? 48
                          : Sizing.isTablet(context)
                              ? 36
                              : 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    portfolio.message,
                    style: TextStyle(
                      fontSize: Sizing.isDesktop(context)
                          ? 24
                          : Sizing.isTablet(context)
                              ? 18
                              : 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
