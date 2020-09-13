import 'package:flutter/material.dart';

class BankAccount with ChangeNotifier {
  int _balance = 0;
  int getBalance() => _balance;

  void increment(int value) {
    _balance += value;
    notifyListeners();
  }

  void decrement(int value) {
    _balance -= value;
    notifyListeners();
  }
}