import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/bottom_navigation_item.dart';

import 'package:flutter_challange/config/theme/constants/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<NavItem> items;
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNavigationBarWidget(
      {required this.items, required this.currentIndex, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Ink(
          decoration: const BoxDecoration(
              color: kPrimaryKColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          // color: kPrimaryKColor,
          child: Row(
              // center vertically
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.from(items.map(
                (e) => BottomNavigationItem(
                    item: e,
                    onTap: (element) {
                      onTap?.call(items.indexOf(element));
                    }),
              ))),
        ),
      ),
    );
  }
}
