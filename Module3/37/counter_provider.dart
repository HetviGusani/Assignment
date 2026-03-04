import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;
  int get count => _count;

  increment(){
    _count++;
    notifyListeners();
  }

  decrement(){
    _count--;
    notifyListeners();
  }
}