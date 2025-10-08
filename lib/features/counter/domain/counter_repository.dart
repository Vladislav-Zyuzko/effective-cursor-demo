abstract class CounterRepository {
  Future<int> getCounter();
  Future<void> incrementCounter();
  Future<void> decrementCounter();
}
