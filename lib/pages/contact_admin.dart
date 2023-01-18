import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class AdminContact extends StatelessWidget {
  final double height;
  const AdminContact({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    double _height = height * 0.05;
    return Container(
      margin: EdgeInsets.only(top: _height),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.phone),
          title: const Text(
            'Ingin bertanya? Kontak Admin',
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
          ),
          style: ListTileStyle.drawer,
          tileColor: kGreyColor,
          onTap: () {},
        ),
      ),
    );
  }
}
