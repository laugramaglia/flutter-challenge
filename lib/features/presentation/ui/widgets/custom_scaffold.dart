import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/bottom_navigation.dart';

class CustomScaffold extends StatefulWidget {
  final List<Widget> body;
  const CustomScaffold({required this.body, super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: _pageController,
        children: widget.body,
      ),
      bottomSheet: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(currentIndex);
          });
        },
      ),
    );
  }
}
