import 'package:flutter/material.dart';
import '../model/category.dart';
import '../provider/category_change_page.dart';
import 'package:provider/provider.dart';

class ChildCategory with ChangeNotifier{

  int page = 0;
  String noMoreText = "";

  List<CategoryPageTitle> childCategoryList = [];
  int childIndex = 0;

  getChildCategory(List<CategoryPageTitle> list) {

    //------------------关键代码start
    page=1;
    noMoreText = '';
    //------------------关键代码end
    childIndex = 0;
    childCategoryList = list;
    notifyListeners();
  }

  // 改变子类的索引
  changeChildIndex(index){

    //------------------关键代码start
    page=1;
    noMoreText = ''; //显示更多的表示
    //------------------关键代码end
    childIndex = index;
    notifyListeners();
  }

  void addPage(){

    page++;
    notifyListeners();
  }

  void changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}

