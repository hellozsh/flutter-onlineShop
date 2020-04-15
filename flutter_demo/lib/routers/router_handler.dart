import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import "package:flutter_demo/pages/category_detail_page.dart";

Handler detailHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parames) {
    String goodsId = parames['id'].first;
    print('index>details goodsID is ${goodsId}');
    return DetailPage(goodsId);
  }
);

