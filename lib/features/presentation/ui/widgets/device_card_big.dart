import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_box.dart';

class DeviceCardBig extends StatelessWidget {
  final String heroTag;
  final bool isActive;
  const DeviceCardBig(
      {required this.heroTag, this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DeviceBox(
        heroTag: heroTag,
        isActive: isActive,
        height: 400,
        width: 400,
        child: Text('hola'),
      ),
    );
  }
}
