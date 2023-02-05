import 'package:flutter/material.dart';
import 'package:ta_schizo/pages/main_page.dart';
import 'package:ta_schizo/shared/theme.dart';

class PrivateDataPage extends StatefulWidget {
  const PrivateDataPage({super.key});

  @override
  State<PrivateDataPage> createState() => _PrivateDataPageState();
}

class _PrivateDataPageState extends State<PrivateDataPage> {
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  bool? _gender;
  FocusNode focusNode = FocusNode();

  InputDecoration customDecoration(String hintText, String label) {
    return InputDecoration(
      isDense: true,
      hintText: "Contoh : $hintText",
      label: Text(label),
      floatingLabelStyle: mainTextStyle,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: kGreyColor, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: kPrimaryColor2, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kPrimaryColor1,
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            width: width / 1.3,
            decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Data Pribadi",
                  style: mainTextStyle.copyWith(
                      fontSize: 18, fontWeight: semibold),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autofocus: true,
                        controller: username,
                        decoration: customDecoration("James", "Nama pengguna")),
                    const SizedBox(height: 16),
                    TextFormField(
                        focusNode: focusNode,
                        controller: age,
                        decoration: customDecoration("22", "Usia")),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<bool>(
                              activeColor: kPrimaryColor2,
                              value: false,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                  focusNode.unfocus();
                                });
                              },
                            ),
                            const Text("Laki-laki")
                          ],
                        ),
                        Row(
                          children: [
                            Radio<bool>(
                              activeColor: kPrimaryColor2,
                              value: true,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                  focusNode.unfocus();
                                });
                              },
                            ),
                            const Text("Perempuan")
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                            (route) => false);
                        focusNode.unfocus();
                      },
                      child: const Text("Lanjut"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: kPrimaryColor2),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}