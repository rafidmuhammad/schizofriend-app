import 'package:flutter/material.dart';
import 'package:ta_schizo/shared/theme.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final T? groupValue;
  final T value;
  final ValueChanged<T?>? onChanged;
  const CustomRadioButton(
      {super.key,
      required this.label,
      this.padding = EdgeInsets.zero,
      required this.groupValue,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged!(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Radio<T>(
              activeColor: kPrimaryColor2,
              groupValue: groupValue,
              value: value,
              onChanged: (newValue) {
                onChanged!(newValue);
              },
            ),
            Expanded(
              child: Text(
                label,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
