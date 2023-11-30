import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_challange/config/theme/constants/colors.dart';

import '../pages/rooms_view.dart';
import '../pages/single_room.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int initialIndex;

  BottomNavigationBarWidget({required this.initialIndex});
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<BottomNavigationBarWidget> {
  late int _currentIndex; // Default index for the selected activity

  // List of activities corresponding to each icon
  final List<String> _activities = [
    "Dashboard",
    "Rooms",
    "Profile",
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          decoration: const BoxDecoration(
            color: kPrimaryKColor,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          // color: kPrimaryKColor,
          child:

          Row(
          // center vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // button for the first activity
            _buildBottomNavigationBarItem(
              context,
              0,
              _currentIndex,
              'dashboard',
              _activities[0],
              () {
                setState(() {
                  _currentIndex = 0;
                });
                _handleRedirect();
              },
            ),
            _buildBottomNavigationBarItem(
              context,
              1,
              _currentIndex,
              'room',
              _activities[1],
                  () {
                setState(() {
                  _currentIndex = 1;
                });
                _handleRedirect();
              },
            ),
            _buildBottomNavigationBarItem(
              context,
              2,
              _currentIndex,
               'profile',
              _activities[2],
                  () {
                setState(() {
                  _currentIndex = 2;
                });
                _handleRedirect();
              },
            ),
          ]
              ),
        ),
      );
  }

  void _handleRedirect() {
    if(_currentIndex == 0) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoomsView()), (route) => false);
    } else if(_currentIndex == 1) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SingleRoomView()), (route) => false);
    } else if(_currentIndex == 2) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProfileView()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RoomsView()), (route) => false);
    }

  }
}

Widget _buildBottomNavigationBarItem(BuildContext context, int myIndex, int currentIndex, String iconAsset, String label, Function onTap) {
  // return the button for the activity
  return Expanded(
    child: GestureDetector(
      onTap: () {
        onTap();
      },
      child:

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: myIndex == currentIndex ? kPrimaryLight : kPrimaryKColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/$iconAsset.svg',
                  colorFilter: ColorFilter.mode(kWhiteKColor, BlendMode.srcIn)
                ),
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
