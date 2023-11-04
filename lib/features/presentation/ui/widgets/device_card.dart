import 'package:flutter/material.dart';
import 'package:flutter_challange/features/data/models/device.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  const DeviceCard(this.device, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              device.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
