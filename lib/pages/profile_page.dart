import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget profPicAndName(double width, double height) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: 17,
            top: height * 0.06,
          ),
          width: 0.2 * width,
          height: 0.1 * height,
          decoration: BoxDecoration(
              color: kGreyColor, borderRadius: BorderRadius.circular(18)),
          child: const Icon(Icons.person),
        ),
        Text(
          "Nama Lengkap",
          style: mainTextStyle.copyWith(fontWeight: medium, fontSize: 20),
        )
      ],
    );
  }

  Widget dataPribadi(double height) {
    return Padding(
      padding: EdgeInsets.only(top: 0.09 * height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Pribadi",
            style: mainTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 17, right: 17, top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Usia"), Text("32")],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 17, right: 17, bottom: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Jenis Kelamin"), Text("Laki-laki")],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customBar("PROFIL"),
      backgroundColor: kPrimaryColor1,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          profPicAndName(width, height),
          dataPribadi(height),
        ],
      ),
    );
  }
}
