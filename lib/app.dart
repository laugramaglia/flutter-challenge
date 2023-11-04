import 'package:flutter/material.dart';
import 'package:flutter_challange/config/app_bootstrap.dart';
import 'package:flutter_challange/config/theme/app_theme.dart';
import 'package:flutter_challange/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => AppBootstrap(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'IOT Challenge',
            theme: AppTheme.themeData,
            home: const HomeScreen()),
      );
}
