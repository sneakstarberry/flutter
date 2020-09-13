import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int _counter;
  get counter => _counter;

  CounterProvider(this._counter);

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}