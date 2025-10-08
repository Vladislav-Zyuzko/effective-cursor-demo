class CounterLocalDataSource {
  int _counter = 0;

  Future<int> getCounter() async => _counter;

  Future<void> incrementCounter() async {
    if (_counter < 10) {
      _counter++;
    }
  }

  Future<void> decrementCounter() async {
    if (_counter > 0) {
      _counter--;
    }
  }
}
