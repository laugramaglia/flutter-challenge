import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state.dart';
import 'package:flutter_challange/comon/async_state_notifier.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';

class DeviceProvider extends AsyncStateNotifier<DevicesList> {
  final DeviceRepository deviceRepository;

  DeviceProvider(BuildContext context, {required this.deviceRepository})
      : super(context);

  @override
  Future<AsyncState<DevicesList>> build() async {
    final (response, error) = await deviceRepository.getDevices();
    if (error != null) return ErrorState(error);
    return DataState(response);
  }
}
