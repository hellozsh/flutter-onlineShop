import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{

  List<CategoryPageTitle> childCategoryList = [];
  int childIndex = 0;

  getChildCategory(List<CategoryPageTitle> list) {

    childIndex = 0;
    childCategoryList = list;
    notifyListeners();
  }

  // 改变子类的索引
  changeChildIndex(index){
    childIndex = index;
    notifyListeners();
  }
}

