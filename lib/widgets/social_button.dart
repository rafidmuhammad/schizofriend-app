import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Uri url;
  final double width;
  const SocialButton(
      {super.key,
      required this.title,
      required this.url,
      required this.width,
      required this.imageUrl});

  Future<void> launch(Uri url, BuildContext context) async {
    try {
      await launchUrl(url);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url, context);
      },
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: 0.14 * width,
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            title,
            style: mainTextStyle.copyWith(fontSize: 17, fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
