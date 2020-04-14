
import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter_demo/config/HttpHeader.dart';
import 'package:flutter_demo/config/service_url.dart';

import 'package:flutter_demo/model/homeModel.dart';

import 'package:flutter_demo/model/ResponseEntity.dart';

// 大括号包起来是可选参数
Future postRequest(url, {formData}) async {
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeaders;
    if(formData == null) {
      response = await dio.post(servicePath[url]);
    }else{

      response = await dio.post(servicePath[url],data: formData);
    }
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
}

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


Future getHomePageFeedContent() async {

  try{
    print('开始拉取下拉列表数据');
    Response response;
    Dio dio = Dio();
    dio.options.headers = httpHeaders;
    homePagePar['page_id'] = 0; // 93541 93544 93547   93553  93556  93559
    response = await dio.post(servicePath['homePageBelowConten'],data: homePagePar);
    if(response. statusCode == 200) {

      return response;
    } else {
      throw Exception('后端接口出现异常');
    }
  }catch(e){
    return print('ERROR: =========> ${e}');
  }
}