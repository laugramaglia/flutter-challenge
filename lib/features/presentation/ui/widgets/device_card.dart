import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_challange/features/data/models/device.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  const DeviceCard(this.device, {super.key});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isActive = false;

  void _onTap() => setState(() {
        isActive = !isActive;
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 144,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey[200],
              child: Transform.rotate(
                  angle: -pi / 2,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Switch.adaptive(
                        value: isActive,
                        onChanged: (_) => _onTap(),
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveTrackColor: Colors.grey,
                      ),
                    ),
                  )),
            ),
            const SizedBox(width: 8),
            Text(
              widget.device.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: isActive ? Colors.white : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
