import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  Color card_color;
  String text_cases;
  String text_report;
  String report_number;
  String card_icon;

  CardWidget({
    super.key,
    required this.card_color,
    required this.text_report,
    required this.report_number,
    required this.card_icon,
    required this.text_cases,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: card_color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cards All Text

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text_cases,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  text_report,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  report_number,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            // Cards Image

            Image.asset(
              card_icon,
              height: 70,
              width: 70,
            ),
          ],
        ),
      ),
    );
  }
}
