import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state_notifier.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';
import 'package:flutter_challange/services/app_exception.dart';

class DeviceProvider extends AsyncStateNotifier<DevicesList> {
  final DeviceRepository deviceRepository;

  DeviceProvider(BuildContext context, {required this.deviceRepository})
      : super(context);

  @override
  Future<DevicesList> build() => _build();

  Future<DevicesList> _build() async {
    final (response, error) = await deviceRepository.getDevices();
    if (error case final error?) throw error;
    return response;
  }
}
