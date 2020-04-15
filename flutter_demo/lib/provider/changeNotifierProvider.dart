
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _count = 0;
  int get count => _count;

  void increment(){
    _count ++;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}
