import 'package:dio/dio.dart';
import 'package:flutter_challange/features/data/models/device.dart';

typedef DevicesList = List<Device>;
typedef FutureDevices = Future<DevicesList>;

class DeviceRepository {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://true-mule-12.hasura.app/api/rest",
      headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret":
            "cO4VdMiCEvTl1emOQU2w2W1sLA6k00420ooAxg40lsg4jaGc0Daj2gSnGlPUbg4O"
      }));

  FutureDevices getDevices() async {
    final Response response = await dio.get('/devices');

    return List<Device>.from(
        response.data['devices'].map((e) => Device.fromJson(e)));
  }
}
