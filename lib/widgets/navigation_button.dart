import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class NavigationButton extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double width;
  final double height;
  final Function() onTap;

  const NavigationButton(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double _width = width * 0.23;
    double _height = height * 0.1;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 0.27 * _width, vertical: 0.27 * _height),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(imageUrl),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: mainTextStyle.copyWith(fontSize: 18, fontWeight: regular),
          ),
        ],
      ),
    );
  }
}
