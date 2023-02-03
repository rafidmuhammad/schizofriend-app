import 'package:flutter/material.dart';
import 'package:ta_schizo/pages/riwayat_pengobatan.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Usia",
                      style: mainTextStyle,
                    ),
                    const Text("32")
                  ],
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      style: mainTextStyle,
                    ),
                    const Text("Laki-laki")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget expansionTile(String title, String body) {
    return ExpansionTile(
      collapsedIconColor: kPrimaryColor2,
      iconColor: kPrimaryColor2,
      title: Expanded(
        child: Text(
          title,
          style: mainTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        ),
      ),
      children: [
        ListTile(
          dense: true,
          title: Text(body),
        ),
      ],
    );
  }

  Widget dataKesehatan() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Kesehatan",
            style: mainTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          const SizedBox(
            height: 14,
          ),
          expansionTile("Diagnosis", "Skizofrenia Hebefrenik (F 20.1)"),
          expansionTile("Dokter Penanggung Jawab", "Dr. Dre"),
          expansionTile("Tanggal Kontrol Terakhir", "1 Maret 2023"),
          expansionTile("Jadwal Kontrol Selanjutnya", "1 Mei 2023"),
        ],
      ),
    );
  }

  Widget riwayat() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Riwayat Penyakit dan Pengobatan",
            style: mainTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.5),
              padding: const EdgeInsets.only(left: 17, right: 17, top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengobatan Saat Ini",
                    style: mainTextStyle,
                  ),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoricalMedicationPage(),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 17),
              padding: const EdgeInsets.only(
                left: 17,
                right: 17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Riwayat Pengobatan",
                    style: mainTextStyle,
                  ),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          expansionTile("Riwayat Penyakit", "Tidak ada")
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
          dataKesehatan(),
          riwayat(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
