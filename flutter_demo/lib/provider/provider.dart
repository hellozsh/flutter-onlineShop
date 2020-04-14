import 'dart:async';

class ProviderBlock {

  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;
  int get counter => _count;

  increment(){
    _countController.sink.add(++_count);
  }

  dispose(){
    _countController.close();
  }
}

