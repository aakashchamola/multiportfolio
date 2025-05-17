import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/models/education_model.dart';
import '../../features/controllers/portfolio_controller.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    List<Education> educationList = controller.portfolioData.value!.education;
    double padding = Sizing.adaptivePadding(context);

    TextStyle headerStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 24
          : Sizing.isTablet(context)
              ? 20
              : 16,
      fontWeight: FontWeight.bold,
    );

    TextStyle bodyStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 16
          : Sizing.isTablet(context)
              ? 14
              : 12,
      color: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Education',
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
          child: ListView.builder(
            itemCount: educationList.length,
            itemBuilder: (context, index) {
              final edu = educationList[index];

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(edu.institution, style: headerStyle),
                            const SizedBox(height: 6),
                            Text(edu.degree, style: bodyStyle),
                            const SizedBox(height: 4),
                            Text('${edu.startDate} - ${edu.endDate}',
                                style: bodyStyle),
                            const SizedBox(height: 4),
                            if (edu.cgpa != null)
                              Text('CGPA: ${edu.cgpa}', style: bodyStyle),
                            if (edu.percentage != null)
                              Text('Percentage: ${edu.percentage}',
                                  style: bodyStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
