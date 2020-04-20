import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_demo/model/cartInfoModel.dart';

class CartProvider with ChangeNotifier{

  String cartString = "[]";
  List<CartInfoMode> cartList=[];

  double allPrice = 0;
  int allGoodsCount = 0;

  bool isAllCheck = true;

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
        'isCheck':true,
      };

      allPrice+=(count*price);
      allGoodsCount+=count;

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
    allPrice=0;
    allGoodsCount=0;
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
      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;

      tempList.forEach((item){
        if(item['isCheck']){
          allPrice+=(item['count'])*(item['price']);
          allGoodsCount+=item['count'];
        }else{
          isAllCheck = false;
        }
        cartList.add(CartInfoMode.fromJson(item));
      });
    }
    notifyListeners();
  }

  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;

        allPrice-=(item['count'])*(item['price']);
        allGoodsCount-=item['count'];
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  changeInfoModel(CartInfoMode cartItem) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString= prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex]=cartItem.toJson();
    cartString=json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  changeAllCheckModels(bool isCheck) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    tempList.forEach((item){
      var newItem = item;
      newItem['isCheck']= isCheck;
      newList.add(newItem);
    });

    cartString = json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }
}