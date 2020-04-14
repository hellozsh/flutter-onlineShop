import 'package:flutter/material.dart';
import 'package:flutter_demo/model/categoryGoodsListModel.dart';

class CategoryGoodsListProvide with ChangeNotifier{

  List<CategoryListData> goodList = [];

  // 点击大类时更换商品列表
  getGoodsList(List<CategoryListData> list){
    goodList = list;
    notifyListeners();
  }
}