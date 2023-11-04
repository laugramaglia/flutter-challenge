import 'package:flutter/material.dart';
import 'package:flutter_challange/features/domain/repositories/device_repository.dart';
import 'package:flutter_challange/features/presentation/providers/device_provider.dart';
import 'package:provider/provider.dart';

class AppBootstrap extends StatelessWidget {
  final Widget child;
  const AppBootstrap({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeviceProvider>(
          create: (context) =>
              DeviceProvider(context, deviceRepository: DeviceRepository()),
        ),
      ],
      child: child,
    );
  }
}
