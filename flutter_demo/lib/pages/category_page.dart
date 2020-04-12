import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/HttpHeader.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'dart:convert';
import '../model/category.dart';

class CategoryPage extends StatefulWidget {

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _getCategory();
    return Container(
      child: Center(
        child: Text('d'),
      ),
    );
  }
  
  void _getCategory() async {

    homePagePar['parent_id'] = "0";
    await postRequest('categoryPageTopTitle', formData: homePagePar).then((val){

      var data = json.decode(val.toString());

      CategoryPageTitle firstTitle = CategoryPageTitle.fromJson(data['data']['list'][0]);
      print("zhousuhua---- first=="+firstTitle.name.toString());
      CategoryPageTitleList list = CategoryPageTitleList.formJson(data['data']['list']);
      list.list.forEach((item) => print('zhousuhua ===== '+item.name.toString()));
    });
  }
}

