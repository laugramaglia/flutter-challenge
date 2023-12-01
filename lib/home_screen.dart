import 'package:flutter/material.dart';
import 'package:flutter_challange/features/presentation/ui/pages/profile_page.dart';
import 'package:flutter_challange/features/presentation/ui/pages/rooms_view.dart';
import 'package:flutter_challange/features/presentation/ui/pages/single_room.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: [RoomsView(), SingleRoomView(), ProfileView()]);
  }
}
