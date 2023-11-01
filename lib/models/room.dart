import 'package:flutter/material.dart';

import '../constants/room_type_eum.dart';

class Room {
  final bool isActive;
  final String title;
  final String subTitle;
  final RoomType roomType;
  final IconData icon;

  Room(this.isActive, this.title, this.subTitle, this.roomType, this.icon);
}
