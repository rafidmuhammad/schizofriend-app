import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminContact extends StatelessWidget {
  final double height;
  AdminContact({super.key, required this.height});

  Future<void> launchingUrl(Uri url, BuildContext context) async {
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  Uri whatsApp = Uri.parse("https://wa.me/62816205800");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchingUrl(whatsApp, context);
      },
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
