import 'package:flutter/material.dart';
import 'package:flutter_challange/config/theme/constants/colors.dart';

class AppTheme {
  /// Default constructor
  AppTheme();

  static ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 120,
          ),
          bodySmall: const TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 12.0,
          ),
          displayMedium: const TextStyle(
            color: Color(0xFF0F0F0F),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          displaySmall: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          displayLarge: const TextStyle(
            color: Color(0xFF0F0F0F),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
          titleLarge: const TextStyle(
            color: Color(0xFF0F0F0F),
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        );

    ColorScheme colorScheme = ColorScheme(
      // Decide how you want to apply your own custom them, to the MaterialApp
      brightness: Brightness.light,
      primary: kPrimaryKColor,
      secondary: kSecondaryColor,
      background: kSreenBgKColor,
      onBackground: kTextLightKColor,
      surface: kDactivateColor,
      onSurface: kDefaultTextKColor,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red.shade400,
    );

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme);

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
