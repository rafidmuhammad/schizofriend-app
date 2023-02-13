import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_schizo/cubit/auth_cubit.dart';
import 'package:ta_schizo/pages/current_medication.dart';
import 'package:ta_schizo/pages/riwayat_pengobatan.dart';
import 'package:ta_schizo/pages/sign_up.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;
  late AuthCubit authData;

  Widget profPicAndName(double width, double height) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 17, top: height * 0.01),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    state.user.imageUrl!,
                    fit: BoxFit.cover,
                    width: 0.2 * width,
                    height: 0.1 * height,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.account_circle,
                        size: 0.2 * width,
                        color: kWhiteColor,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: 0.2 * width,
                        height: 0.1 * height,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor2,
                            value: loadingProgress.expectedTotalBytes != null
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
              Text(
                state.user.username!,
                style: mainTextStyle.copyWith(fontWeight: medium, fontSize: 20),
              )
            ],
          );
        }
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
              username!,
              style: mainTextStyle.copyWith(fontWeight: medium, fontSize: 20),
            )
          ],
        );
      },
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 17, right: 17, top: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Usia",
                            style: mainTextStyle,
                          ),
                          Text(
                            state.user.age!,
                            style: mainTextStyle,
                          )
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
                          Text(state.user.gender!)
                        ],
                      ),
                    )
                  ],
                );
              }
              return Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 13),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Usia",
                          style: mainTextStyle,
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 15,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Tidak dapat mengambil data",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
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
                        const Expanded(
                          child: SizedBox(
                            width: 15,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Tidak dapat mengambil data",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget expansionTile(String title, String body) {
    return ExpansionTile(
      collapsedIconColor: kPrimaryColor2,
      iconColor: kPrimaryColor2,
      title: Text(
        title,
        style: mainTextStyle.copyWith(fontSize: 14, fontWeight: regular),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrentMedicationPage(),
                  ));
            },
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
                    builder: (context) => const HistoricalMedicationPage(),
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return expansionTile(
                    "Riwayat Penyakit", state.user.riwayatPenyakit!);
              }
              return expansionTile(
                  "Riwayat Penyakit", "Sedang tidak dapat menerima data");
            },
          )
        ],
      ),
    );
  }

  Widget signOutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [buildPopUpMenu()],
    );
  }

  Widget buildPopUpMenu() {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 1) {
          context.read<AuthCubit>().signOut();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
              (route) => false);
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: const [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 10,
                ),
                Text("Log Out")
              ],
            ),
          )
        ];
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authData = context.read<AuthCubit>();
    setState(() {
      username = authData.getValue("username");
    });
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
          signOutButton(),
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
