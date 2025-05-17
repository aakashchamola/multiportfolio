import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/utils/constants.dart';
import 'package:multiportfolio/features/controllers/portfolio_controller.dart';
import 'package:multiportfolio/features/models/profile_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    Profile profile = controller.portfolioData.value!.profile;
    double padding = Sizing.adaptivePadding(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: AnimationLimiter(
          child: ListView(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 600),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                Center(
                  child: ClipOval(
                    child: profile.image.isNotEmpty
                        ? Image.network(
                            profile.image,
                            width: Sizing.isDesktop(context)
                                ? 150
                                : Sizing.isTablet(context)
                                    ? 120
                                    : 100,
                            height: Sizing.isDesktop(context)
                                ? 150
                                : Sizing.isTablet(context)
                                    ? 120
                                    : 100,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: Sizing.isDesktop(context)
                                ? 150
                                : Sizing.isTablet(context)
                                    ? 120
                                    : 100,
                            height: Sizing.isDesktop(context)
                                ? 150
                                : Sizing.isTablet(context)
                                    ? 120
                                    : 100,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: Sizing.isDesktop(context)
                        ? 42
                        : Sizing.isTablet(context)
                            ? 32
                            : 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  profile.title,
                  style: TextStyle(
                    fontSize: Sizing.isDesktop(context)
                        ? 24
                        : Sizing.isTablet(context)
                            ? 18
                            : 14,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _buildContactSection(context, profile.contact),
                const SizedBox(height: 24),
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: Sizing.isDesktop(context)
                        ? 28
                        : Sizing.isTablet(context)
                            ? 22
                            : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  profile.summary,
                  style: TextStyle(
                    fontSize: Sizing.isDesktop(context)
                        ? 20
                        : Sizing.isTablet(context)
                            ? 16
                            : 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context, Contact contact) {
    TextStyle labelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Sizing.isDesktop(context)
          ? 20
          : Sizing.isTablet(context)
              ? 16
              : 14,
    );

    TextStyle valueStyle = TextStyle(
      fontSize: Sizing.isDesktop(context)
          ? 18
          : Sizing.isTablet(context)
              ? 14
              : 12,
      color: Colors.blue[700],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: labelStyle),
        const SizedBox(height: 8),
        if (contact.address.isNotEmpty)
          Text('Address: ${contact.address}', style: valueStyle),
        if (contact.email.isNotEmpty)
          Text('Email: ${contact.email}', style: valueStyle),
        if (contact.phone.isNotEmpty)
          Text('Phone: ${contact.phone}', style: valueStyle),
        if (contact.linkedin.isNotEmpty)
          GestureDetector(
            onTap: () => {_launchURL(contact.linkedin)},
            child: Text(
              'LinkedIn Profile',
              style: valueStyle.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        if (contact.github.isNotEmpty)
          GestureDetector(
            onTap: () => {_launchURL(contact.github)},
            child: Text(
              'Github Profile',
              style: valueStyle.copyWith(decoration: TextDecoration.underline),
            ),
          ),
      ],
    );
  }
}
