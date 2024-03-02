import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final String text1;
  final String text2;
  final String text3;
  const CustomCard(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              text1,
              style: cardRegularTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text2,
              style: cardHeadingTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text3,
              style: cardRegularTextStyle,
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
