import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_challange/config/theme/constants/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget(
      {required this.currentIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: const BoxDecoration(
            color: kPrimaryKColor,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        // color: kPrimaryKColor,
        child: Row(
            // center vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => _buildBottomNavigationBarItem(
                context,
                index,
                currentIndex,
                'dashboard',
                "Dashboard",
                () {
                  onTap.call(index);
                },
              ),
            )
            //   [
            //   // button for the first activity
            //   _buildBottomNavigationBarItem(
            //     context,
            //     0,
            //     currentIndex,
            //     'dashboard',
            //     "Dashboard",
            //     () {
            //       onTap.call(0);
            //     },
            //   ),
            //   _buildBottomNavigationBarItem(
            //       context, 1, currentIndex, 'room', "Rooms", () {
            //     onTap.call(1);
            //   }),
            //   _buildBottomNavigationBarItem(
            //     context,
            //     2,
            //     currentIndex,
            //     'profile',
            //     'Profile',
            //     () {
            //       onTap.call(2);
            //     },
            //   ),
            // ]
            ),
      ),
    );
  }

  // void _handleRedirect() {
  //   if(_currentIndex == 0) {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoomsView()), (route) => false);
  //   } else if(_currentIndex == 1) {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SingleRoomView()), (route) => false);
  //   } else if(_currentIndex == 2) {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProfileView()), (route) => false);
  //   } else {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoomsView()), (route) => false);
  //   }

  // }
}

Widget _buildBottomNavigationBarItem(BuildContext context, int myIndex,
    int currentIndex, String iconAsset, String label, Function() onTap) {
  // return the button for the activity
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: myIndex == currentIndex
                ? kPrimaryLight
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/$iconAsset.svg',
                  colorFilter: ColorFilter.mode(kWhiteKColor, BlendMode.srcIn)),
              if (myIndex == currentIndex)
                const SizedBox(
                  width: 5,
                ),
              if (myIndex == currentIndex)
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
