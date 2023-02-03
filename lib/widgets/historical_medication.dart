import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class HistoricalCard extends StatelessWidget {
  const HistoricalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        isThreeLine: true,
        title: Text(
          "Risperidone",
          style: TextStyle(fontWeight: semibold),
        ),
        subtitle: Text("Tab 2 mg | 2 x 1\n1/10/2023 - 1/12/2022"),
      ),
    );
  }
}
