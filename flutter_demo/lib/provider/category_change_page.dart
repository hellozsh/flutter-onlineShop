import 'package:flutter/material.dart';

class CategoryChangePage with ChangeNotifier {

  int page = 0;
  String noMoreText = "";

  void addPage(){

    page++;
    notifyListeners();
  }

  void changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}