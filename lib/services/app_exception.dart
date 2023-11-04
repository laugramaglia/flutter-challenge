import 'dart:convert';

class AppException implements Exception {
  final String message;
  final String code;

  AppException({required this.message, required this.code});

  @override
  String toString() {
    return "$code: $message";
  }

  String? get parsedError {
    try {
      final responseData = json.decode(message) as Map<String, dynamic>;

      if (responseData.containsKey('non_field_errors')) {
        return responseData['non_field_errors'][0];
      }
    } catch (_) {}

    return null;
  }
}
