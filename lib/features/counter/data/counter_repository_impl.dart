import 'package:cursor_demo/features/counter/data/counter_local_datasource.dart';
import 'package:cursor_demo/features/counter/domain/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource _localDataSource;

  CounterRepositoryImpl(this._localDataSource);

  @override
  Future<int> getCounter() => _localDataSource.getCounter();

  @override
  Future<void> incrementCounter() => _localDataSource.incrementCounter();
}
