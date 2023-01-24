import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final EdgeInsets margin;
  final double height;
  const BlogCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      this.margin = EdgeInsets.zero,
      this.height = 220});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      //height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: kGreyColor),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      imageUrl,
                    ))),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: mainTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: medium,
                  overflow: TextOverflow.visible),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Baca lebih lanjut"),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
