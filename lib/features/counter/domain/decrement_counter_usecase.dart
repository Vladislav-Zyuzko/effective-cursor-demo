import 'package:cursor_demo/features/counter/domain/counter_repository.dart';

class DecrementCounterUseCase {
  final CounterRepository _repository;

  DecrementCounterUseCase(this._repository);

  Future<void> call() async {
    await _repository.decrementCounter();
  }

  Future<int> get callStream => _repository.getCounter();
}
