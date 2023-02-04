import 'package:flutter/material.dart';
import 'package:ta_schizo/pages/main_page.dart';
import 'package:ta_schizo/pages/splash_page.dart';
import 'package:ta_schizo/pages/wecome_page.dart';
import 'package:ta_schizo/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schizofriend',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPrimaryColor1,
      ),
      home: SplashPage(),
    );
  }
}
