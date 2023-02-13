import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_schizo/cubit/auth_cubit.dart';
import 'package:ta_schizo/pages/main_page.dart';
import 'package:ta_schizo/pages/sign_up.dart';
import 'package:ta_schizo/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.preferences});
  final SharedPreferences preferences;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () async {
        bool isLoggedIn = await context.read<AuthCubit>().isSignedIn();
        if (!mounted) return;
        if (isLoggedIn) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
              (route) => false);
          // context.read<AuthCubit>().getUserDataByID(user.uid);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
              (route) => false);
        }
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
