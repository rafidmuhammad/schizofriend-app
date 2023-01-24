import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

import 'nav_halaman_utama.dart';

PreferredSizeWidget customBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const BackToMain(),
              const SizedBox(height: 20),
              const Spacer(),
              Text(
                title,
                style: mainTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    ),
  );
}
