import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';
import 'package:ta_schizo/widgets/custom_radio_button.dart';

enum EfekSamping {
  tidakAda,
  detakTidakBeraturan,
  kejangOtot,
  kakuOtot,
  gelisah,
  stabilitas,
  abnormalWajah,
  demam,
  urinGelap,
  linglungBerat,
  airLiur,
  lelah,
  kantuk,
  kesadaran,
  pusing
}

class SideEffectPage extends StatefulWidget {
  const SideEffectPage({super.key});

  @override
  State<SideEffectPage> createState() => _SideEffectPageState();
}

class _SideEffectPageState extends State<SideEffectPage> {
  EfekSamping? _efek = EfekSamping.tidakAda;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar("EFEK SAMPING"),
      backgroundColor: kPrimaryColor1,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 3,
                // offset: Offset(2, 2),
              )
            ], color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                CustomRadioButton(
                  label: "Tidak ada",
                  groupValue: _efek,
                  value: EfekSamping.tidakAda,
                  onChanged: (EfekSamping? value) {
                    setState(
                      () {
                        _efek = value;
                      },
                    );
                  },
                ),
                CustomRadioButton(
                  label:
                      "Detak jantung tidak teratur (lebih lambat/lebih cepat)",
                  groupValue: _efek,
                  value: EfekSamping.detakTidakBeraturan,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Kejang otot",
                  groupValue: _efek,
                  value: EfekSamping.kejangOtot,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Kaku otot",
                  groupValue: _efek,
                  value: EfekSamping.kakuOtot,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  padding: const EdgeInsets.only(bottom: 10),
                  label:
                      "Tidak mampu untuk duduk diam/gelisah (selalu mondar mandir, menggeser atau mengetukkan kaki)",
                  groupValue: _efek,
                  value: EfekSamping.gelisah,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  padding: const EdgeInsets.only(bottom: 10),
                  label:
                      "Kesulitan menjaga stabilitas saat mengubah posisi tubuh",
                  groupValue: _efek,
                  value: EfekSamping.stabilitas,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label:
                      "Gerakan abnormal pada otot wajah yang tidak terkontrol (mengecapkan bibir, berkedip, melengkungkan alis, menjulurkan lidah)",
                  groupValue: _efek,
                  value: EfekSamping.abnormalWajah,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Demam",
                  groupValue: _efek,
                  value: EfekSamping.demam,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Urin berwarna gelap",
                  groupValue: _efek,
                  value: EfekSamping.urinGelap,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Linglung berat",
                  groupValue: _efek,
                  value: EfekSamping.linglungBerat,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Peningkatan jumlah air liur",
                  groupValue: _efek,
                  value: EfekSamping.airLiur,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Mudah lelah",
                  groupValue: _efek,
                  value: EfekSamping.lelah,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Mengantuk",
                  groupValue: _efek,
                  value: EfekSamping.kantuk,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Kesadaran turun",
                  groupValue: _efek,
                  value: EfekSamping.kesadaran,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                CustomRadioButton(
                  label: "Pusing/sakit kepala",
                  groupValue: _efek,
                  value: EfekSamping.pusing,
                  onChanged: (EfekSamping? value) {
                    setState(() {
                      _efek = value;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFD9D9D9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Selesai",
                    style: mainTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                //const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
