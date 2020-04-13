import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{

  List<CategoryPageTitle> childCategoryList = [];
  getChildCategory(List<CategoryPageTitle> list) {

    childCategoryList = list;
    notifyListeners();
  }
}

