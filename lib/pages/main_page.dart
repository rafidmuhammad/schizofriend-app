import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Halo!\nDini",
                    style: titleTextStyle.copyWith(
                        fontSize: (width * 0.08), fontWeight: semibold),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kGreyColor),
                  child: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 61,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
