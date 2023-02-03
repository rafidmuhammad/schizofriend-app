import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/constant.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';
import 'package:ta_schizo/widgets/social_button.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  Widget header() {
    return Container();
  }

  Widget firstRowLink(double width, BuildContext context) {
    final Uri webUrlLaunch = Uri.parse(webUrl);
    final Uri facebookLaunch = Uri.parse(facebook);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SocialButton(
            title: 'Web',
            url: webUrlLaunch,
            imageUrl: 'assets/pictures/web.png',
            width: width),
        SocialButton(
            title: 'Facebook',
            url: facebookLaunch,
            imageUrl: 'assets/pictures/facebook.png',
            width: width),
      ],
    );
  }

  Widget secondRowLink(double width, BuildContext context) {
    final Uri twitterLaunch = Uri.parse(twitter);
    final Uri instagramLaunch = Uri.parse(instagram);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SocialButton(
            title: 'Twitter',
            url: twitterLaunch,
            imageUrl: 'assets/pictures/twitter.png',
            width: width),
        SocialButton(
            title: 'Instagram',
            url: instagramLaunch,
            imageUrl: 'assets/pictures/instagram.png',
            width: width),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      appBar: customBar("KOMUNITAS"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            SizedBox(
              height: 0.05 * height,
            ),
            Image.asset(
              "assets/pictures/organization.png",
              width: 241,
              height: 92,
            ),
            const SizedBox(
              height: 81,
            ),
            firstRowLink(width, context),
            const SizedBox(
              height: 33,
            ),
            secondRowLink(width, context),
          ],
        ),
      )),
    );
  }
}
