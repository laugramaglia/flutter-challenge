import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class SingleRoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Room View'),
      ),
      body: Center(
        child: Text(
          'Single Room Placeholder',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 1)
    );
  }
}