import 'package:flutter/material.dart';
import 'package:flutter_challange/home_screen.dart';

import 'constants/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IOT Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryKColor),
        useMaterial3: true,
      ),
      home: const HomeScreen());
}
