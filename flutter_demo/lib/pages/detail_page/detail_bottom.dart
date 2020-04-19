import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:flutter_demo/provider/cart.dart';
import 'package:provider/provider.dart';

class DetailBottom extends StatelessWidget {
//  return Consumer<DetailsInfoProvide>(
//  builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {
//
//  if(detailInfo.isLeft){

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DetailsInfoProvide>(
        builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {
          return Container(
            width: ScreenUtil().setWidth(750),
            color: Colors.white,
            height: ScreenUtil().setHeight(80),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: ScreenUtil().setWidth(110),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 35,
                      color: Colors.red,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    var goodInfo = detailInfo.goodsInfo.data.goodInfo;
                    Provider.of<CartProvider>(context, listen: false).save(goodInfo.goodsId,goodInfo.goodsName,1,goodInfo.oriPrice,goodInfo.image1);
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(320),
                    height: ScreenUtil().setHeight(80),
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "加入购物车",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(28),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Provider.of<CartProvider>(context, listen: false).remove();
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(320),
                    height: ScreenUtil().setHeight(80),
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      "马上购买",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(28),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
    );
  }
}