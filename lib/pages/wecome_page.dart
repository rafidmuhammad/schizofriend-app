import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class NightPage extends StatelessWidget {
  final String name;
  const NightPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/pictures/night.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: (0.5 * height),
                ),
                Text("Selamat Malam",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        fontSize: (width * 0.1), fontWeight: semibold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$name!",
                  textAlign: TextAlign.center,
                  style: titleTextStyle.copyWith(
                      fontSize: (width * 0.1), fontWeight: semibold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DaylightPage extends StatelessWidget {
  final String name;
  const DaylightPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            "assets/pictures/daylight.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: (0.5 * height),
                ),
                Text("Selamat Malam",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        fontSize: (width * 0.1), fontWeight: semibold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$name!",
                  textAlign: TextAlign.center,
                  style: titleTextStyle.copyWith(
                      fontSize: (width * 0.1), fontWeight: semibold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
