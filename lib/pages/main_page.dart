import 'package:flutter/material.dart';
import 'package:ta_schizo/pages/calendar_page.dart';
import 'package:ta_schizo/pages/community_page.dart';
import 'package:ta_schizo/pages/contact_admin.dart';
import 'package:ta_schizo/pages/education_page.dart';
import 'package:ta_schizo/pages/profile_page.dart';
import 'package:ta_schizo/pages/side_effect_page.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/medication_card.dart';
import 'package:ta_schizo/widgets/navigation_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget header(double width, BuildContext context) {
    double size = width * 0.14;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                overflow: TextOverflow.ellipsis,
                "Halo!\nDini",
                style: mainTextStyle.copyWith(
                    fontSize: (width * 0.08), fontWeight: semibold),
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
              child: Container(
                width: size,
                height: size,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kGreyColor),
                child: const Icon(Icons.person),
              ),
            ),
          ],
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      body: SafeArea(
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
    );
  }
}
