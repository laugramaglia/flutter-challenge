import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isActive,
      required this.icon});
  final String title;
  final String subTitle;
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? primaryKColor : whiteKColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: isActive
                    ? whiteKColor.withOpacity(0.16)
                    : Colors.black.withOpacity(0.16),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                icon,
                color: isActive ? whiteKColor : primaryKColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isActive ? whiteKColor : defaultTextKColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subTitle,
              style: TextStyle(
                color: isActive ? whiteKColor : textLightKColor,
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

