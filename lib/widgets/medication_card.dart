import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class MedicationCard extends StatelessWidget {
  final String name;
  final String time;
  final bool isAfterMeal;
  final Function() onTap;
  const MedicationCard(
      {super.key,
      required this.name,
      required this.time,
      required this.isAfterMeal,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    //double _height = height * 0.02;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Card(
        color: kGreyColor,
        child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            "assets/pictures/obat.png",
            width: 27,
          ),
          title: Text(
            overflow: TextOverflow.ellipsis,
            name,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          subtitle: Text(
            '$time | ${isAfterMeal ? "Setelah makan" : "Sebelum makan"}',
            style: detailTextStyle,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
