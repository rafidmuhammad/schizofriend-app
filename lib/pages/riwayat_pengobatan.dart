import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:ta_schizo/widgets/custom_bar.dart';
import 'package:ta_schizo/widgets/historical_medication.dart';

class HistoricalMedicationPage extends StatelessWidget {
  const HistoricalMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar("Riwayat Pengobatan"),
      backgroundColor: kPrimaryColor1,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          MedicationProfileCard(
            title: "Risperidone",
            dose: "Tab 2 mg | 2 x 1 ",
            time: "1/10/2023 - 1/12/2022",
            onTap: null,
          )
        ],
      ),
    );
  }
}
