import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void multiDos() {
    _counter = _counter * 2;
    notifyListeners();
  }

    void multiTres() {
    _counter = _counter * 3;
    notifyListeners();
  }

    void multiCinco() {
    _counter = _counter * 5;
    notifyListeners();
  }
  

  bool esPrimo(int numero) {
    if (numero < 2) return false;
    if (numero == 2) return true;
    if (numero % 2 == 0) return false;
    for (int i = 3; i <= (numero / 2).toInt(); i += 2) {
      if (numero % i == 0) return false;
    }
    return true;
  }
}
