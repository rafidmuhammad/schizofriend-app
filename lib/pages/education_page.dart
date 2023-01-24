import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/blog_card.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';
import 'package:ta_schizo/widgets/nav_halaman_utama.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar("LAMAN EDUKASI"),
      backgroundColor: kPrimaryColor1,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          const SizedBox(
            height: 26,
          ),
          const BlogCard(
              imageUrl: "assets/pictures/head.png",
              title: "Mengenal Skizoprenia Lebih Jauh"),
          const BlogCard(
            imageUrl: "assets/pictures/bottle.png",
            title: "Hal Yang Harus Dilakukan Jika Lupa Minum Obat",
            margin: EdgeInsets.only(
              top: 40,
            ),
          ),
          const BlogCard(
            imageUrl: "assets/pictures/handover.png",
            title: "Pentingnya menjaga kepatuhan pengobatan",
            margin: EdgeInsets.only(
              top: 40,
            ),
          ),
          const BlogCard(
            imageUrl: "assets/pictures/couple.png",
            title: "Hal Yang Harus Dilakukan Jika Lupa Minum Obat",
            margin: EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
          ),
          //   ],
          // )
        ],
      ),
    );
  }
}
