import 'package:ab_solution_portfolio/pages/main/components/social_media.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionIntro extends StatelessWidget {
  final bool isMobile;

  const SectionIntro({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/coding_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10,
          vertical: 64,
        ),
        child: isPortrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sectionLeft(context, isPortrait),
                  const SizedBox(height: 16),
                  Flexible(child: _sectionRight(context)),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _sectionLeft(context, isPortrait),
                  const SizedBox(width: 24),
                  Flexible(child: _sectionRight(context)),
                ],
              ),
      ),
    );
  }

  Widget _sectionLeft(context, bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Image(
            image: const AssetImage('assets/images/programmer.png'),
            height: isMobile ? 156 : 256,
          ),
        ),
        const SizedBox(height: 8),
        const Flexible(
          child: SocialMedia(),
        )
      ],
    );
  }

  Widget _sectionRight(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m Abdullah and I\'m an Android Developer',
          style: Theme.of(context).textTheme.headlineLarge?.apply(
                color: const Color(0xFFFDCB00),
              ),
        ),
        const SizedBox(height: 8),
        const Flexible(
          child: Text(
            'I\'m an experienced Android developer with 5 years of expertise in creating high-quality and innovative mobile applications. Over the course of my career, I have worked with two reputable companies, gaining valuable experience and contributing to the success of various projects.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFDCB00),
              foregroundColor: Colors.white,
            ),
            onPressed: () => _downloadResume(),
            child: const Text(
              'Download Resume',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _downloadResume() async {
    const downloadUrl =
        'https://drive.google.com/file/d/1fOt6KvILsgy_x5qzt0jtVgbPbWTl6X9K/view?usp=sharing';
    if (await canLaunchUrl(Uri.parse(downloadUrl))) {
      await launchUrl(Uri.parse(downloadUrl));
    } else {}
  }
}
