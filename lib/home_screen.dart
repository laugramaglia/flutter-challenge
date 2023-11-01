import 'package:flutter/material.dart';

import 'constants/app_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: appTabBarTitles
                  .map(
                    (e) => Tab(text: e),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
