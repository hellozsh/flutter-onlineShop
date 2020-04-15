import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/HttpHeader.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './categoryPage/RightCategoryNav.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import './categoryPage/CategoryGoodsList.dart';
import 'package:flutter_demo/model/categoryGoodsListModel.dart';
import '../provide/category_goods_list.dart';

import 'package:fluro/fluro.dart';
import '../pages/category_detail_page.dart';

class CategoryPage extends StatefulWidget {

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  final router = Router();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav(),
              CategoryGoodsList(),
            ],
          )
        ],
      ),
    );
  }
}


// 左侧导航菜单
class LeftCategoryNav extends StatefulWidget {

  _leftCategoryNavState createState() => _leftCategoryNavState();
}

class _leftCategoryNavState extends State<LeftCategoryNav> {

  List<CategoryPageTitle> list = [];
  var choseListIndex = 0;

  final List<String> categoryIdS = [
    "2c9f6c946cd22d7b016cd74220b70040",
    "2c9f6c946cd22d7b016cd732f0f6002f",
    "2c9f6c946cd22d7b016cd747e4bb0046",
    "2c9f6c946449ea7e01647ccfddb3001e",
    "2c9f6c94708ed2340170be2761951014"
  ];
  var choseCategoryIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {

          return _leftInkWell(index);
        },
      ),
    );
  }

  void _getCategory() async {

    homePagePar['parent_id'] = "0"; // 0
    await postRequest('categoryPageTopTitle', formData: homePagePar).then((val){
      var data = json.decode(val.toString());
      CategoryPageTitleList pageTitleList = CategoryPageTitleList.formJson(data['data']['list']);

      setState(() {
        list = pageTitleList.list;
      });
      _setChildCategory(list[choseListIndex].id);
//      list.list.forEach((item) => print('zhousuhua ===== '+item.name.toString()));
    });
  }

  void _setChildCategory(String id) async {

    homePagePar['parent_id'] = id; // 0
    await postRequest('categoryPageTopTitle', formData: homePagePar).then((val){
      var data = json.decode(val.toString());
      CategoryPageTitleList pageTitleList = CategoryPageTitleList.formJson(data['data']['list']);
      Provide.value<ChildCategory>(context).getChildCategory(pageTitleList.list);

      // 修改商品列表数组
      choseCategoryIndex ++;
      if(choseCategoryIndex >= categoryIdS.length) {
        choseCategoryIndex = 0;
      }
      _getGoodList(categoryIdS[choseCategoryIndex]);
    });
  }

  void _getGoodList(String categoryId) async {
    var data = {
      'categoryId': categoryId == null ? '2c9f6c946cd22d7b016cd74220b70040': categoryId,
      'categorySubId': '',
      'page': 1
    };
    print("zhousuhua ===="+data.toString());
    await postRequest('getMallGoods', formData: data).then((val){

      var responData = json.decode(val.toString());
      print("zhousuhua ===="+responData.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(responData);
      if(goodsList.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);
      }
    });
  }

  Widget _leftInkWell(int index) {

    bool isClick = false;
    isClick = (index == choseListIndex) ? true : false;
    return InkWell(
      onTap: (){
        setState(() {
          choseListIndex = index;
        });
        _setChildCategory(list[index].id);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isClick?Color.fromRGBO(236, 238, 239, 1.0):Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Text(list[index].name, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
      ),
    );
  }
}

