import 'package:cursor_demo/features/counter/domain/counter_repository.dart';

class IncrementCounterUseCase {
  final CounterRepository _repository;

  IncrementCounterUseCase(this._repository);

  Future<void> call() async {
    await _repository.incrementCounter();
  }

  Future<int> get callStream => _repository.getCounter();
}
