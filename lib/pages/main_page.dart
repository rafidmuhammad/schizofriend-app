import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/navigation_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget header(double width) {
    double size = width * 0.14;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
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
              onTap: () {},
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

  Widget firstRowButtons(double width, double height) {
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
          onTap: () {},
        )
      ],
    );
  }

  Widget secondRowButtons(double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationButton(
          imageUrl: "assets/pictures/jadwal.png",
          title: "Jadwal\nKontrol",
          width: width,
          height: height,
          onTap: () {},
        ),
        NavigationButton(
          title: "Komunitas",
          imageUrl: "assets/pictures/komunitas.png",
          width: width,
          height: height,
          onTap: () {},
        ),
        NavigationButton(
          title: "Laman\nEdukasi",
          imageUrl: "assets/pictures/edukasi.png",
          width: width,
          height: height,
          onTap: (() {}),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: SizedBox(
          child: ListView(
            children: [
              header(width),
              const Divider(thickness: 2),
              const SizedBox(
                height: 40,
              ),
              firstRowButtons(width, height),
              const SizedBox(
                height: 40,
              ),
              secondRowButtons(width, height),
            ],
          ),
        ),
      ),
    );
  }
}
