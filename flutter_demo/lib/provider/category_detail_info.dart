import 'package:flutter/material.dart';
import 'package:flutter_demo/model/detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{

  bool isLeft = true;

  CategoryDetailRes _goodsInfo;

  CategoryDetailRes get goodsInfo => _goodsInfo;

  // 从后台获取商品信息
  getGoodsInfo(String id){
    postRequest().then((val){

      var responData = json.decode(val.toString());
      _goodsInfo = CategoryDetailRes.fromJson(responData);

      notifyListeners();
    });
  }

  Future postRequest() async {
    try{
      Response response;
      Dio dio = new Dio();
      response = await dio.post("http://rest.apizza.net/mock/5dd3071030912e35521d7984fd5389fb/getDetail");
      if(response.statusCode == 200){
        return response;
      }else{
        throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
      return print('ERROR:======>${e}');
    }
  }

  changeLeftChose(bool isChose){
    isLeft = isChose;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}