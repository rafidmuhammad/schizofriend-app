import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class MedicationProfileCard extends StatelessWidget {
  final String title;
  final String dose;
  final String time;
  final Function()? onTap;
  final bool isCurrent;
  const MedicationProfileCard(
      {super.key,
      this.isCurrent = false,
      required this.onTap,
      required this.dose,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: ListTile(
          onTap: onTap,
          trailing:
              isCurrent ? Icon(Icons.keyboard_arrow_right) : SizedBox.shrink(),
          isThreeLine: true,
          title: Text(
            title,
            style: TextStyle(fontWeight: semibold),
          ),
          subtitle: Text("$dose\n$time"),
        ),
      ),
    );
  }
}
