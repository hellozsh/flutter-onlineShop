import 'package:flutter/material.dart';
import 'package:flutter_demo/config/service_url.dart';
import 'package:flutter_demo/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_demo/model/categoryGoodsListModel.dart';

class CategoryGoodsList extends StatefulWidget {

  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  List<CategoryListData> list = [];
  @override
  void initState() {
    // TODO: implement initState
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('商品列表'),
    );
  }

  // categoryId=2c9f6c946cd22d7b016cd74220b70040&categorySubId=2c9f6c946cd22d7b016cd7426d700041&page=1
  void _getGoodList() async {
    var data = {
      'categoryId': '2c9f6c946cd22d7b016cd74220b70040',
      'categorySubId': '',
      'page': 1
    };
    await postRequest('getMallGoods', formData: data).then((val){

      var responData = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(responData);
      setState(() {
        list = goodsList.data;
      });
      list.forEach((v){
        print("分类商品列表: >>>>>>>"+v.goodsName);
      });
    });
  }
}