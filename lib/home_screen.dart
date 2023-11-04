import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_challange/api/api.dart';
import 'package:flutter_challange/models/data_set/data_set.dart';
import 'package:flutter_challange/models/data_set/datum.dart';
import 'package:flutter_challange/models/data_set/device.dart';

import 'constants/app_colors.dart';
import 'views/widgets/room_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<RoomsNeed> roomslist = [];
  List<Device> totalDevices = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var value = await Api.getData();

      var data = DataSet.fromJson(json.decode(value));

      roomslist = data.data!;

      for (var i in data.data!) {
        totalDevices.addAll(i.devices ?? []);
      }
      isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading == false
            ? DefaultTabController(
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
                                tabs: [
                                  Text("All rooms"),
                                  ...List.generate(
                                    roomslist.length,
                                    (index) =>
                                        Text(roomslist[index].title ?? ""),
                                  )
                                ]),
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            child: TabBarView(
                              children: [
                                GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount:
                                      totalDevices.length, // Number of items
                                  itemBuilder: (context, ind) {
                                    var item = totalDevices[ind];
                                    return RoomCard(
                                      title: item.displayName ?? "",
                                      subTitle: item.device ?? "",
                                      icon: Icons.abc,
                                      isActive: item.state != null
                                          ? (item.state == 0 ? true : false)
                                          : false,
                                    );
                                  },
                                ),
                                ...List.generate(
                                    roomslist.length,
                                    (index) => GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: roomslist[index]
                                              .devices!
                                              .length, // Number of items
                                          itemBuilder: (context, ind) {
                                            var item =
                                                roomslist[index].devices![ind];
                                            return RoomCard(
                                              title: item.displayName ?? "",
                                              subTitle: item.device ?? "",
                                              icon: Icons.abc,
                                              isActive: item.state != null
                                                  ? (item.state == 0
                                                      ? true
                                                      : false)
                                                  : false,
                                            );
                                          },
                                        )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
