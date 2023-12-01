import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_challange/features/presentation/providers/device_provider.dart';
import 'package:flutter_challange/features/presentation/ui/widgets/device_card_small.dart';
import 'package:provider/provider.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RoomState();
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
