import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/custom_rect_tween.dart';
import 'package:flutter_challange/comon/hero_dialog_route.dart';
import 'package:flutter_challange/features/data/models/device.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_box.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_card_big.dart';

class DeviceCardSmall extends StatefulWidget {
  final Device device;
  const DeviceCardSmall(this.device, {super.key});

  @override
  State<DeviceCardSmall> createState() => _DeviceCardSmallState();
}

class _DeviceCardSmallState extends State<DeviceCardSmall> {
  bool isActive = false;

  void _onTap() => setState(() {
        isActive = !isActive;
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: _onTap,
      onLongPress: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return DeviceCardBig(
            heroTag: widget.device.id,
            isActive: isActive,
          );
        }));
      },
      child: DeviceBox(
        isActive: isActive,
        heroTag: widget.device.id,
        width: 144,
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
