import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  final Color iconTint;

  const SocialMedia({super.key, this.iconTint = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: _iconButton(
            onPressed: () => _navigateToGoogle(),
            icon: Icon(BoxIcons.bxl_google, color: iconTint),
            iconTint: iconTint,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: _iconButton(
            onPressed: () => _navigateToLinkedin(),
            icon: Icon(BoxIcons.bxl_linkedin, color: iconTint),
            iconTint: iconTint,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: _iconButton(
            onPressed: () => _navigateToGithub(),
            icon: Icon(BoxIcons.bxl_github, color: iconTint),
            iconTint: iconTint,
          ),
        ),
      ],
    );
  }

  Widget _iconButton(
      {required Function() onPressed,
      required Icon icon,
      Color iconTint = Colors.white}) {
    return IconButton(
      style: IconButton.styleFrom(
        side: BorderSide(
          width: 0.5,
          color: iconTint,
        ),
      ),
      onPressed: () => onPressed(),
      icon: icon,
    );
  }

  Future<void> _navigateToGithub() async {
    const downloadUrl = 'https://github.com/abdullahabd15';
    if (await canLaunchUrl(Uri.parse(downloadUrl))) {
      await launchUrl(Uri.parse(downloadUrl));
    } else {}
  }

  Future<void> _navigateToLinkedin() async {
    const downloadUrl = 'https://www.linkedin.com/in/abdullah-25346016b/';
    if (await canLaunchUrl(Uri.parse(downloadUrl))) {
      await launchUrl(Uri.parse(downloadUrl));
    } else {}
  }

  Future<void> _navigateToGoogle() async {
    const downloadUrl =
        'https://developers.google.com/profile/u/abdullahabd915';
    if (await canLaunchUrl(Uri.parse(downloadUrl))) {
      await launchUrl(Uri.parse(downloadUrl));
    } else {}
  }
}
