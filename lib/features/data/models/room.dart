import 'package:flutter/material.dart';

class Room {
  final bool isActive;
  final String title;
  final String subTitle;
  final IconData icon;

  Room(this.isActive, this.title, this.subTitle, this.icon);
}
