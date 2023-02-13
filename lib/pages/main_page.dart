import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_schizo/cubit/auth_cubit.dart';
import 'package:ta_schizo/pages/calendar_page.dart';
import 'package:ta_schizo/pages/community_page.dart';
import 'package:ta_schizo/pages/contact_admin.dart';
import 'package:ta_schizo/pages/education_page.dart';
import 'package:ta_schizo/pages/profile_page.dart';
import 'package:ta_schizo/pages/side_effect_page.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/medication_card.dart';
import 'package:ta_schizo/widgets/navigation_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AuthCubit authData;
  String? username;
  String? userId;
  String? imageUrl;

  Widget header(double width, BuildContext context) {
    double size = width * 0.15;
    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.fade,
                      "Halo!\n${state.user.username}",
                      style: mainTextStyle.copyWith(
                          fontSize: (width * 0.07), fontWeight: semibold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: size,
                        height: size,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.account_circle,
                            size: size,
                            color: kWhiteColor,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: size,
                            height: size,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor2,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.fade,
                      "Halo!\n$username",
                      style: mainTextStyle.copyWith(
                          fontSize: (width * 0.07), fontWeight: semibold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Icon(
                          Icons.account_circle,
                          size: size,
                        )),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget firstRowButtons(double width, double height, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationButton(
          imageUrl: "assets/pictures/gejala.png",
          title: "Pantau\nGejala",
          width: width,
          height: height,
          onTap: () {},
        ),
        NavigationButton(
          title: "Pantau\nEfek Samping\nObat",
          imageUrl: "assets/pictures/side_effect.png",
          width: width,
          height: height,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SideEffectPage(),
                ));
          },
        )
      ],
    );
  }

  Widget secondRowButton(double width, double height, BuildContext context) {
    return NavigationButton(
      title: "Komunitas",
      imageUrl: "assets/pictures/komunitas.png",
      width: width,
      height: height,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommunityPage(),
            ));
      },
    );
  }

  Widget thirdRowButtons(double width, double height, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationButton(
          imageUrl: "assets/pictures/jadwal.png",
          title: "Jadwal\nKontrol",
          width: width,
          height: height,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalendarPage(),
                ));
          },
        ),
        NavigationButton(
          title: "Laman\nEdukasi",
          imageUrl: "assets/pictures/edukasi.png",
          width: width,
          height: height,
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EducationPage(),
                ));
          }),
        ),
      ],
    );
  }

  Widget currentMedication() {
    return Column(
      children: [
        MedicationCard(
          name: "Clozapine",
          isAfterMeal: true,
          time: "08.00 • 22.00",
          onTap: () {},
        ),
        MedicationCard(
          name: "Trihexyphenidyl",
          isAfterMeal: true,
          time: "08.00 • 13.00 • 19.00",
          onTap: () {},
        ),
      ],
    );
  }

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<void> openDialog() async {
    switch (await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.zero,
          children: [
            Container(
              color: kPrimaryColor2,
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: kWhiteColor,
                    ),
                  ),
                  Text(
                    "Exit app",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Are you sure to exit app?",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 0);
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.cancel,
                      color: kPrimaryColor2,
                    ),
                  ),
                  Text(
                    'Cancel',
                    style: TextStyle(
                        color: kPrimaryColor2, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.check_circle,
                      color: kPrimaryColor2,
                    ),
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                        color: kPrimaryColor2, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        );
      },
    )) {
      case 0:
        break;
      case 1:
        exit(0);
      default:
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authData = context.read<AuthCubit>();

    setState(() {
      username = authData.getValue("username");
      userId = authData.getValue("userId");
      imageUrl = authData.getValue("imageUrl");
    });

    // authData.getUserDataByID(userId!);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      body: WillPopScope(
        onWillPop: onBackPress,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: topMargin),
            children: [
              header(width, context),
              const Divider(thickness: 2),
              const SizedBox(
                height: 40,
              ),
              firstRowButtons(width, height, context),
              const SizedBox(
                height: 20,
              ),
              secondRowButton(width, height, context),
              const SizedBox(
                height: 20,
              ),
              thirdRowButtons(width, height, context),
              const SizedBox(
                height: 20,
              ),
              currentMedication(),

              AdminContact(height: height),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
