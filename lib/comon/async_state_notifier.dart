import 'package:flutter/material.dart';
import 'package:flutter_challange/comon/async_state.dart';

abstract class AsyncStateNotifier<T> with ChangeNotifier {
  final BuildContext context;

  AsyncStateNotifier(this.context) {
    AsyncState.guard(build()).then((value) => state = value);
  }

  Future<T> build();

  AsyncState<T> _state = AsyncState<T>.loading();

  AsyncState<T> get state => _state;

  set state(AsyncState<T> value) {
    if (_state != value) {
      _state = value;
      notifyListeners();
    }
  }
}
