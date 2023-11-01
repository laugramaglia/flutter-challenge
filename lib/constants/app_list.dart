import 'package:flutter/material.dart';

import '../models/room.dart';
import 'room_type_eum.dart';

const List<String> appTabBarTitles = [
  'All Room',
  'Living Room',
  'Bedroom',
  'Bathroom',
];

final List<Room> roomList = [
  Room(true, 'Living Room', '3 device', RoomType.living, Icons.home),
  Room(false, 'Bedroom', '3 device', RoomType.bed, Icons.home),
  Room(false, 'Dining Room', '3 device', RoomType.all, Icons.home),
  Room(false, 'Bathroom', '3 device', RoomType.bath, Icons.home),
];
