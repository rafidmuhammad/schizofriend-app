import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_schizo/cubit/auth_cubit.dart';
import 'package:ta_schizo/pages/splash_page.dart';
import 'package:ta_schizo/shared/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    preferences: preferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;
  const MyApp({super.key, required this.preferences});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(preferences: preferences),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Schizofriend',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: kPrimaryColor1,
        ),
        home: SplashPage(preferences: preferences),
      ),
    );
  }
}
