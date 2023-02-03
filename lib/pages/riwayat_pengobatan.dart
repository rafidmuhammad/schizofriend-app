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
        children: [HistoricalCard()],
      ),
    );
  }
}
