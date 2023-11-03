import 'dart:math';

import 'package:flutter/services.dart';

class Api {
  static Future<String> getData() async {
    Random random = Random();
    int number = random.nextInt(2);
    // Load the JSON file from the assets directory
    return Future.delayed(const Duration(seconds: 2),
        () async => await rootBundle.loadString(_getDataEndpoint(number)));
  }
// If not using dart 3 please replace this switch case.
  static String _getDataEndpoint(int number) => switch (number) {
        0 => 'assets/data.json',
        _ => 'assets/error.json',
      };
}
