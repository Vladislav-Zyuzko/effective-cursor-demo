import 'package:flutter/material.dart';
import 'package:cursor_demo/features/counter/domain/increment_counter_usecase.dart';

class CounterViewModel extends ChangeNotifier {
  final IncrementCounterUseCase _incrementCounterUseCase;
  int _counter = 0;

  CounterViewModel(this._incrementCounterUseCase) {
    _loadCounter();
  }

  int get counter => _counter;

  Future<void> _loadCounter() async {
    _counter = await _incrementCounterUseCase.callStream;
    notifyListeners();
  }

  Future<void> increment() async {
    await _incrementCounterUseCase.call();
    _loadCounter();
  }
}
