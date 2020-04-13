import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/HttpHeader.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'dart:convert';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './categoryPage/RightCategoryNav.dart';

class CategoryPage extends StatefulWidget {

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

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
              RightCategoryNav()
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

    homePagePar['parent_id'] = "1"; // 0
    await postRequest('categoryPageTopTitle', formData: homePagePar).then((val){
      var data = json.decode(val.toString());
      CategoryPageTitleList pageTitleList = CategoryPageTitleList.formJson(data['data']['list']);

      setState(() {
        list = pageTitleList.list;
      });
//      list.list.forEach((item) => print('zhousuhua ===== '+item.name.toString()));
    });
  }

  Widget _leftInkWell(int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
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

