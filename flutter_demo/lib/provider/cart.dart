import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_demo/model/cartInfoModel.dart';

class CartProvider with ChangeNotifier{

  String cartString = "[]";
  List<CartInfoMode> cartList=[];

  save(goodsId, goodsName,count,price,images) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');

    var temp = cartString==null?[]:json.decode(cartString.toString());

    List<Map> tempList = (temp as List).cast();
    var isHave = false;
    int ival = 0;
    tempList.forEach((item){
      if(item['goodsId']==goodsId){
        tempList[ival]['count']=item['count']+1;
        cartList[ival].count++;
        isHave = true;
      }
      ival++;
    });
    if(!isHave){
      Map<String, dynamic> newGoods={
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images,
      };
      tempList.add(newGoods);
      cartList.add(CartInfoMode.fromJson(newGoods));
    }
    cartString=json.encode(tempList).toString();
    print(cartString);
    print(cartList.toString());
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartList=[];
    if(cartString==null){
      cartList=[];
    }else{
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item){
        cartList.add(CartInfoMode.fromJson(item));
      });
    }
    notifyListeners();
  }
}