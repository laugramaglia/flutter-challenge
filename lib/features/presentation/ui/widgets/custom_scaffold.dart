import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/pages/profile_page.dart';
import 'package:flutter_challange/features/presentation/ui/pages/rooms_view.dart';
import 'package:flutter_challange/features/presentation/ui/pages/single_room.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/bottom_navigation.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/bottom_navigation_item.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NavItem> items = [
      NavItem(
        active: currentIndex == 0,
        icon: Icons.dashboard,
        label: 'Dashboard',
        page: const RoomsView(),
      ),
      NavItem(
        active: currentIndex == 1,
        icon: Icons.power_settings_new_sharp,
        label: 'Chat',
        page: const SingleRoomView(),
      ),
      NavItem(
        active: currentIndex == 2,
        icon: Icons.person,
        label: 'Profile',
        page: const ProfileView(),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: List.from(items.map((e) => e.page)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        items: items,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.animateToPage(currentIndex,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
