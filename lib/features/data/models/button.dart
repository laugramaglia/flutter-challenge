import 'package:flutter_challange/features/data/models/ir_code_info.dart';

class Button {
  final String id;
  final String title;
  final String description;
  final IrCodeInfo irCodeInfo;

  Button({
    required this.id,
    required this.title,
    required this.description,
    required this.irCodeInfo,
  });

  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      irCodeInfo: IrCodeInfo.fromJson(json['ir_code_info']),
    );
  }
}
