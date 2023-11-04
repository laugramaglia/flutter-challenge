import 'package:flutter/material.dart';
import 'package:flutter_challange/services/app_exception.dart';

abstract class AsyncStateNotifier<T> with ChangeNotifier {
  final BuildContext context;

  AsyncStateNotifier(this.context) {
    HomeState.guard(build()).then((value) => state = value);
  }

  Future<T> build();

  HomeState<T> _state = LoadingState<T>();

  HomeState<T> get state => _state;

  set state(HomeState<T> value) {
    if (_state != value) {
      _state = value;
      notifyListeners();
    }
  }
}

//home_state.dart
sealed class HomeState<T> {
  static Future<HomeState<T>> guard<T>(
    Future<T> future,
  ) async {
    try {
      return DataState(await future);
    } on AppException catch (e) {
      return ErrorState(e);
    } catch (e) {
      return ErrorState(
          AppException(message: e.toString(), code: "unnown error"));
    }
  }
}

class LoadingState<T> extends HomeState<T> {}

class DataState<T> extends HomeState<T> {
  final T data;
  DataState(this.data);
}

class ErrorState<T> extends HomeState<T> {
  final AppException error;
  ErrorState(this.error);
}

extension State<T> on HomeState<T> {
  map(
          {required Function() loading,
          required Function(AppException error) error,
          required Function(T data) data}) =>
      switch (this) {
        LoadingState() => loading.call(),
        DataState(data: var value) => data.call(value),
        ErrorState(error: var err) => error.call(err),
      };
}
