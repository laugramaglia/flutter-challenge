import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state_notifier.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';

class DeviceProvider extends AsyncStateNotifier<DevicesList> {
  final DeviceRepository deviceRepository;

  DeviceProvider(
      {required this.deviceRepository, required BuildContext context})
      : super(context);

  @override
  FutureDevices build() => deviceRepository.getDevices();
}
