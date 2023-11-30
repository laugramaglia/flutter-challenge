import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text(
            'Profile Placeholder',
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 2)
    );
  }
}