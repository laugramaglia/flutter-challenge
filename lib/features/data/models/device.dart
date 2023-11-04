import 'package:flutter_challange/features/data/models/button.dart';

class Device {
  final String id;
  final String name;
  final List<Button> buttons;

  Device({
    required this.id,
    required this.name,
    required this.buttons,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    final List<dynamic> buttonList = json['buttons'];
    final List<Button> buttons =
        buttonList.map((button) => Button.fromJson(button)).toList();

    return Device(
      id: json['id'],
      name: json['name'],
      buttons: buttons,
    );
  }
}
