import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Api {
  static Future<Map<String, dynamic>> getData() async {
    // Load the JSON file from the assets directory
    String jsonString = await rootBundle.loadString('assets/data.json');

    // Parse the JSON string into a Map
    Map<String, dynamic> jsonData = json.decode(jsonString);
    debugPrint(jsonData.toString());
    return jsonData;
  }
}
