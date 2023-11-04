import 'package:flutter/material.dart';
import 'package:flutter_challange/config/theme/constants/colors.dart';

class AppTheme {
  /// Default constructor
  AppTheme();

  static ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = ThemeData.light().textTheme;

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
    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        .copyWith(useMaterial3: true);

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
