import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';
import 'package:ta_schizo/widgets/historical_medication.dart';

class CurrentMedicationPage extends StatelessWidget {
  const CurrentMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      appBar: customBar("Pengobatan Saat Ini"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          MedicationProfileCard(
            title: "Clozapine",
            dose: "Tab 100 mg | 2 x 1 ",
            time: "1/1/2023 - 1/2/2023",
            onTap: () {},
            isCurrent: true,
          ),
          MedicationProfileCard(
            title: "Trihexylphenidyl",
            dose: "Tab 2 mg | 3 x 1 ",
            time: "1/1/2023 - 1/2/2023",
            onTap: () {},
            isCurrent: true,
          ),
        ],
      ),
    );
  }
}
