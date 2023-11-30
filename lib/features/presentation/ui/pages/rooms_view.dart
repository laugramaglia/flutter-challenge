import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state.dart';
import 'package:flutter_challange/comon/async_state_notifier.dart';
import 'package:flutter_challange/features/data/models/device.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';
import 'package:flutter_challange/features/presentation/providers/device_provider.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_card_small.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navigation.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Challenge App'),
        ),
        body: _RoomState(),
        bottomNavigationBar: BottomNavigationBarWidget(initialIndex: 0),
    );
  }
}

class _RoomState extends StatelessWidget {
  const _RoomState();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DeviceProvider>().state;

    return state.map(
      error: (err) => Center(child: Text(err.message)),
      loading: () => const Center(child: CupertinoActivityIndicator()),
      data: (data) => Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
          child: Wrap(
            children: data.map((e) => DeviceCardSmall(e)).toList(),
          )),
    );
  }
}
