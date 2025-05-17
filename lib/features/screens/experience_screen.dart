import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/controllers/portfolio_controller.dart';
import 'package:multiportfolio/features/models/experience_model.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    List<Experience> experiences = controller.portfolioData.value!.experience;
    double padding = Sizing.adaptivePadding(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final exp = experiences[index];

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildExperienceCard(context, exp),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience exp) {
    TextStyle headerStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 24
          : Sizing.isTablet(context)
              ? 20
              : 16,
      fontWeight: FontWeight.bold,
    );

    TextStyle subHeaderStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 18
          : Sizing.isTablet(context)
              ? 16
              : 14,
      fontWeight: FontWeight.w600,
      color: Colors.grey[700],
    );

    // TextStyle bodyStyle = TextStyle(
    //   fontSize: Sizing.isDesktop(context)
    //       ? 16
    //       : Sizing.isTablet(context)
    //           ? 14
    //           : 12,
    // );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exp.company, style: headerStyle),
            const SizedBox(height: 4),
            Text('${exp.industry} | ${exp.location}', style: subHeaderStyle),
            const SizedBox(height: 12),

            // Check if multiple roles
            if (exp.roles.isNotEmpty)
              ...exp.roles.map((role) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildRoleSection(context, role),
                  )),
            // fallback if no roles (if applicable)
            // else Text('No detailed roles provided', style: bodyStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSection(BuildContext context, Role role) {
    TextStyle roleTitleStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 18
          : Sizing.isTablet(context)
              ? 16
              : 14,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    );

    TextStyle dateStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 14
          : Sizing.isTablet(context)
              ? 12
              : 10,
      color: Colors.grey[600],
    );

    TextStyle responsibilitiesStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 16
          : Sizing.isTablet(context)
              ? 14
              : 12,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(role.role, style: roleTitleStyle),
        Text('${role.startDate} - ${role.endDate}', style: dateStyle),
        const SizedBox(height: 6),
        ...role.responsibilities.map(
          (resp) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 20)),
              Expanded(child: Text(resp, style: responsibilitiesStyle)),
            ],
          ),
        ),
      ],
    );
  }
}
