import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_challange/features/data/models/device.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_card.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  final List<String> rooms = const ['Livingroom'];
  final List<Device> devices = const [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.transparent,
                  tabs: <Tab>[
                    const Tab(text: 'All rooms'),
                    for (String item in rooms) Tab(text: item),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: TabBarView(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final response =
                              await DeviceRepository().getDevices();
                          log(response.toString());
                        },
                        child: const Text('Try'),
                      ),
                      Wrap(
                        children: devices.map((e) => DeviceCard(e)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
