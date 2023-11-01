import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'constants/app_list.dart';
import 'constants/room_type_eum.dart';
import 'models/room.dart';
import 'views/widgets/room_card.dart';

// import 'constants/app_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Room> allRooms;
  late List<Room> livingRooms;
  late List<Room> bedRooms;
  late List<Room> bathRooms;

  @override
  void initState() {
    allRooms = roomList;
    livingRooms = roomList.where((element) => element.roomType == RoomType.living).toList();
    bedRooms = roomList.where((element) => element.roomType == RoomType.bed).toList();
    bathRooms = roomList.where((element) => element.roomType == RoomType.bath).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: screenBgKColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
          child: Column(
            children: [
              SizedBox(
                height: 54.0,
                child: TabBar(
                  labelColor: primaryKColor,
                  indicatorColor: primaryKColor,
                  unselectedLabelColor: textLightKColor,
                  isScrollable: false,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                  tabs: appTabBarTitles
                      .map(
                        (e) => Tab(
                          text: e,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                      ),
                      itemCount: allRooms.length, // Number of items
                      itemBuilder: (context, index) {
                        return RoomCard(
                          title: allRooms[index].title,
                          subTitle: allRooms[index].subTitle,
                          icon: allRooms[index].icon,
                          isActive: allRooms[index].isActive,
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: livingRooms.length, // Number of items
                      itemBuilder: (context, index) {
                        return RoomCard(
                          title: livingRooms[index].title,
                          subTitle: livingRooms[index].subTitle,
                          icon: livingRooms[index].icon,
                          isActive: livingRooms[index].isActive,
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: bedRooms.length, // Number of items
                      itemBuilder: (context, index) {
                        return RoomCard(
                          title: bedRooms[index].title,
                          subTitle: bedRooms[index].subTitle,
                          icon: bedRooms[index].icon,
                          isActive: bedRooms[index].isActive,
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: bathRooms.length, // Number of items
                      itemBuilder: (context, index) {
                        return RoomCard(
                          title: bathRooms[index].title,
                          subTitle: bathRooms[index].subTitle,
                          icon: bathRooms[index].icon,
                          isActive: bathRooms[index].isActive,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
