import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/constant.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/nav_halaman_utama.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

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

  Widget header() {
    return Container();
  }

  Widget firstRowLink(double width, BuildContext context) {
    final Uri webUrlLaunch = Uri.parse(webUrl);
    final Uri facebookLaunch = Uri.parse(facebook);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            launch(webUrlLaunch, context);
          },
          child: Column(
            children: [
              Image.asset(
                "assets/pictures/web.png",
                width: 0.17 * width,
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Web",
                style:
                    mainTextStyle.copyWith(fontSize: 17, fontWeight: semibold),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            launch(facebookLaunch, context);
          },
          child: Column(
            children: [
              Image.asset(
                "assets/pictures/facebook.png",
                width: 0.17 * width,
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Facebook",
                style:
                    mainTextStyle.copyWith(fontSize: 17, fontWeight: semibold),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget secondRowLink(double width, BuildContext context) {
    final Uri twitterLaunch = Uri.parse(twitter);
    final Uri instagramLaunch = Uri.parse(instagram);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            launch(twitterLaunch, context);
          },
          child: Column(
            children: [
              Image.asset(
                "assets/pictures/twitter.png",
                width: 0.17 * width,
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Twitter",
                style:
                    mainTextStyle.copyWith(fontSize: 17, fontWeight: semibold),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            launch(instagramLaunch, context);
          },
          child: Column(
            children: [
              Image.asset(
                "assets/pictures/instagram.png",
                width: 0.17 * width,
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                "Instagram",
                style:
                    mainTextStyle.copyWith(fontSize: 17, fontWeight: semibold),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: topMargin),
        child: Column(
          children: [
            BackToMain(),
            SizedBox(
              height: 0.14 * height,
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
