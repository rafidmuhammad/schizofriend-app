import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ta_schizo/pages/sign_up.dart';
import 'package:ta_schizo/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ),
            (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor2,
      body: Center(
        child: Text(
          "Schizofriend",
          style:
              TextStyle(fontFamily: "Damion", color: kWhiteColor, fontSize: 45),
        ),
      ),
    );
  }
}
