import 'package:flutter/material.dart';
import 'package:ta_schizo/main.dart';
import 'package:ta_schizo/shared/theme.dart';

class AdminContact extends StatelessWidget {
  final double height;
  const AdminContact({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    double _height = height * 0.05;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone,
              color: Colors.green,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Kontak admin",
              style:
                  mainTextStyle.copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
