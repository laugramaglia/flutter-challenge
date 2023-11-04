import 'package:flutter_challange/services/app_exception.dart';

class AsyncState<T> {
  ///Loading
  const AsyncState.loading();

  ///Data
  const AsyncState.data(T value);

  ///Error
  const AsyncState.error(AppException error);

  ///Unexpected error
  const AsyncState.unknownError({required String message});

  static Future<AsyncState<T>> guard<T>(
    Future<T> future,
  ) async {
    try {
      return AsyncState.data(await future);
    } on AppException catch (e) {
      return AsyncState.error(e);
    } catch (e) {
      return AsyncState.unknownError(message: e.toString());
    }
  }
}
