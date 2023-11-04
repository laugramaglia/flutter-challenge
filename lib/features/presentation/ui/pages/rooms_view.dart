import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state.dart';
import 'package:flutter_challange/comon/async_state_notifier.dart';
import 'package:flutter_challange/features/data/models/device.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';
import 'package:flutter_challange/features/presentation/providers/device_provider.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_card.dart';
import 'package:provider/provider.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  final List<String> rooms = const ['Livingroom'];
  final List<Device> devices = const [];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DeviceProvider>().state;
    return state.map(
      error: (err) => Material(child: Center(child: Text(err.message))),
      loading: () =>
          const Material(child: Center(child: CupertinoActivityIndicator())),
      data: (data) => DefaultTabController(
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
                        Wrap(
                          children: devices.map((e) => DeviceCard(e)).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
