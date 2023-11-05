import 'package:dio/dio.dart';
import 'package:flutter_challange/features/data/models/device.dart';
import 'package:flutter_challange/services/app_exception.dart';

typedef DevicesList = List<Device>;
typedef FutureDevicesOrError = Future<(DevicesList, AppException?)>;

class DeviceRepository {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://true-mule-12.hasura.app/api/rest",
      headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret":
            "cO4VdMiCEvTl1emOQU2w2W1sLA6k00420ooAxg40lsg4jaGc0Daj2gSnGlPUbg4O"
      }));

  FutureDevicesOrError getDevices() async {
    try {
      final Response response = await dio.get('/devices');

      final List<Device> finalResponse = List<Device>.from(
          response.data['devices'].map((e) => Device.fromJson(e)));
      return (finalResponse, null);
    } on DioException catch (err) {
      return (
        <Device>[],
        AppException(message: err.message ?? err.type.name, code: err.type.name)
      );
    } catch (err) {
      return (
        <Device>[],
        AppException(message: err.toString(), code: 'server_error')
      );
    }
  }
}
