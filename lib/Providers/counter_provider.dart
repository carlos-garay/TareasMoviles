import 'dart:math';

import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0;
  bool _isPrime = false;

  bool get isPrime => _isPrime;
  int get counter => _counter; // Variable publica

  void increment(){
    _counter++;
    notifyListeners(); // Le avisa a los listeners que cambió un dato
  }

  void decrement(){
    _counter--;
    notifyListeners(); // Le avisa a los listeners que cambió un dato
  }
  
  void reset(){
    _counter = 0;
    notifyListeners(); // Le avisa a los listeners que cambió un dato
  }

  void multiDos(){
    _counter *= 2;
    notifyListeners(); // Le avisa a los listeners que cambió un dato
  }

  void multiTres(){
    _counter *= 3;
    notifyListeners();
  }

  void multiCinco(){
    _counter *= 5;
    notifyListeners();
  }

  void prime(){
    if (_counter <= 1) {
      _isPrime = false;
      notifyListeners();
      return;
    }
    
    for (int i = 2; i <= sqrt(_counter).toInt(); i++) {
      if (_counter % i == 0) {
        _isPrime = false;
        notifyListeners();
        return; 
      }
    }
    _isPrime = true;
    notifyListeners();
    return;

  }

}