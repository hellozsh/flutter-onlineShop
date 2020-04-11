import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_demo/config/HttpHeader.dart';
import 'package:flutter_demo/config/service_url.dart';

import 'package:flutter_demo/model/homeModel.dart';

import 'package:flutter_demo/model/ResponseEntity.dart';

Future getHomePageContext() async{
  
  try{
    print('开始获取首页数据......');
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeaders;

    response = await dio.post(servicePath['homePageContext'],data: homePagePar);
    if(response.statusCode == 200){
//      ResponseEntity res =
//      ResponseEntity.fromJson(json.decode(response.toString()));
//      HomeContext infoBean = HomeContext.fromJson(res.data);
      return response;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
}