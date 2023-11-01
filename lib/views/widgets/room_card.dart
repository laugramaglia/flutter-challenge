import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.bgColor,
      required this.textColor,
      required this.title,
      required this.subTitle,
      required this.isActive,
      required this.icon});
  final Color bgColor;
  final Color textColor;
  final String title;
  final String subTitle;
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              color: deactivateColor,
              child: Icon(
                icon,
                color: textColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: bgColor == primaryKColor ? textLightKColor : whiteKColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Switch(value: isActive, onChanged: (val) {}),
          ],
        ),
      ),
    );
  }
}
