import 'package:flutter/material.dart';
import 'package:flutter_challange/config/theme/constants/colors.dart';

class BottomNavigationItem extends StatelessWidget {
  final NavItem item;
  final Function(NavItem) onTap;
  const BottomNavigationItem(
      {required this.item, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          onTap(item);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60,
          constraints: const BoxConstraints(minWidth: 90, maxWidth: 140),
          decoration: BoxDecoration(
            color: item.active
                ? kPrimaryLight
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 24,
                ),
                if (item.active) ...[
                  const SizedBox(width: 5),
                  Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;
  final bool active;
  final Widget page;

  NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.page,
  });

  NavItem copyWith({
    IconData? icon,
    String? label,
    Function()? onTap,
    bool? active,
    Widget? page,
  }) {
    return NavItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      active: active ?? this.active,
      page: page ?? this.page,
    );
  }
}
