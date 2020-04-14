import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/model/categoryGoodsListModel.dart';
import 'package:flutter_demo/provide/category_goods_list.dart';
import 'package:provide/provide.dart';

class CategoryGoodsList extends StatefulWidget {

  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    // TODO: implement initState
//    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Provide<CategoryGoodsListProvide>(

      builder: (context, child, data){
        if(data.goodList.length > 0) {
          return Expanded(
              child: Container(
                width: ScreenUtil().setWidth(570),
                height: ScreenUtil().setHeight(1000),
                child: ListView.builder(
                  itemCount: data.goodList.length,
                  itemBuilder: (context, index){
                    return _ListWidget(data.goodList,index);
                  },
                ),
              )
          );
        } else {
          return Text('暂时没有数据');
        }
      }
    );
  }

  // categoryId=2c9f6c946cd22d7b016cd74220b70040&categorySubId=2c9f6c946cd22d7b016cd7426d700041&page=1

  Widget _goodsImage(List newList,index){
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList,index){
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodsPrice(List newList,index){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text('价格:¥${newList[index].presentPrice}',style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),)
          ,
          Text('¥${newList[index].oriPrice}',
          style: TextStyle(
            color: Colors.black26,
            decoration: TextDecoration.lineThrough
          ),)
        ],
      ),
    );
  }
  
  Widget _ListWidget(List newList ,int index){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(newList,index),
            Column(
              children: <Widget>[
                _goodsName(newList,index),
                _goodsPrice(newList,index)
              ],
            )
          ],
        ),
      ),
    );
  }
}