import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class BackToMain extends StatelessWidget {
  const BackToMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(children: [
        Icon(
          Icons.arrow_back,
          color: kPrimaryColor2,
        ),
      ]),
    );
  }
}
