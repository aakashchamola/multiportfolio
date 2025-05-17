import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/models/project_model.dart';
import '../../features/controllers/portfolio_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    List<Project> projects = controller.portfolioData.value!.projects;
    double padding = Sizing.adaptivePadding(context);
    TextStyle titleStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 22
          : Sizing.isTablet(context)
              ? 18
              : 14,
      fontWeight: FontWeight.bold,
    );

    TextStyle descStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 16
          : Sizing.isTablet(context)
              ? 14
              : 12,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final proj = projects[index];
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
                            Text(proj.title, style: titleStyle),
                            const SizedBox(height: 8),
                            Text(proj.description, style: descStyle),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: proj.techStack
                                  .map((tech) => Chip(
                                        label: Text(tech,
                                            style: TextStyle(
                                              fontSize:
                                                  Sizing.isDesktop(context)
                                                      ? 14
                                                      : Sizing.isTablet(context)
                                                          ? 12
                                                          : 10,
                                            )),
                                        backgroundColor: Colors.grey.shade200,
                                      ))
                                  .toList(),
                            ),
                            if (proj.link.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () => _launchURL(proj.link),
                                child: Text(
                                  'View Project',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: Sizing.isDesktop(context)
                                        ? 14
                                        : Sizing.isTablet(context)
                                            ? 12
                                            : 10,
                                  ),
                                ),
                              ),
                            ],
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
