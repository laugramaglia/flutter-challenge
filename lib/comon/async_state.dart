import 'package:flutter/material.dart';
import 'package:flutter_challange/services/app_exception.dart';

sealed class AsyncState<T> {
  Widget map(
          {required Function() loading,
          required Function(AppException error) error,
          required Function(T data) data}) =>
      switch (this) {
        LoadingState() => loading.call(),
        ErrorState(error: var err) => error.call(err),
        DataState(data: var value) => data.call(value),
      };
}

class LoadingState<T> extends AsyncState<T> {}

class DataState<T> extends AsyncState<T> {
  final T data;
  DataState(this.data);
}

class ErrorState<T> extends AsyncState<T> {
  final AppException error;
  ErrorState(this.error);
}
