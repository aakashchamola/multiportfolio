import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/controllers/portfolio_controller.dart';
import 'package:multiportfolio/features/models/certification_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    double padding = Sizing.adaptivePadding(context);
    List<Certification> certifications =
        controller.portfolioData.value!.certifications;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certifications'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: certifications.length,
            itemBuilder: (context, index) {
              final certification = certifications[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildCertificationCard(certification, context),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCertificationCard(
      Certification certification, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              certification.title,
              style: TextStyle(
                fontSize: Sizing.isDesktop(context) ? 24 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              certification.institution,
              style: TextStyle(
                fontSize: Sizing.isDesktop(context) ? 18 : 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              certification.date,
              style: TextStyle(
                fontSize: Sizing.isDesktop(context) ? 16 : 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: certification.skills
                  .map((skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  Uri url = Uri.parse(certification.link);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                ),
                child: const Text('View Certificate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
