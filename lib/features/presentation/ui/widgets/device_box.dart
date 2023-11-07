import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/custom_rect_tween.dart';

class DeviceBox extends StatelessWidget {
  final Widget child;
  final bool isActive;
  final double? height, width;
  final String heroTag;
  const DeviceBox(
      {required this.child,
      required this.heroTag,
      this.isActive = false,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      createRectTween: (begin, end) => CustomRectTween(begin: begin, end: end),
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}
