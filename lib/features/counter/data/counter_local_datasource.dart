class CounterLocalDataSource {
  int _counter = 0;

  Future<int> getCounter() async => _counter;

  Future<void> incrementCounter() async {
    _counter++;
  }
}
