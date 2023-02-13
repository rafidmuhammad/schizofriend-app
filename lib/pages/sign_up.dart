import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ta_schizo/cubit/auth_cubit.dart';
import 'package:ta_schizo/pages/main_page.dart';
import 'package:ta_schizo/pages/private_data_page.dart';
import 'package:ta_schizo/shared/theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      // 'nature1',
      // 'nature2',
      'nature3',
      'nature4',
      'nature5'
    ];
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          child: CarouselSlider(
            items: images
                .map((item) => Image.asset(
                      "assets/pictures/$item.jpeg",
                      height: height,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayCurve: Curves.easeInOut),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            width: width / 1.7,
            decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Selamat datang",
                  style: mainTextStyle.copyWith(
                      fontSize: 18, fontWeight: semibold),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is AuthSuccess) {
                      Fluttertoast.showToast(msg: "Berhasil masuk");
                      if (state.user.age!.isNotEmpty &&
                          state.user.gender!.isNotEmpty) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                            (route) => false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivateDataPage(),
                            ),
                            (route) => false);
                      }
                    } else if (state is AuthFailed) {
                      Fluttertoast.showToast(msg: "Gagal Masuk");
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<AuthCubit>().signInWithGoogle();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 20, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: Image.asset(
                              "assets/pictures/google.png",
                              width: 40,
                            ),
                          ),
                        ),
                        Text(
                          "Masuk",
                          style: mainTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
