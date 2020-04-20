import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/cart.dart';

class CartBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[

          selectAllBtn(context),
          allPriceArea(context),
          goButton(context)
        ],
      ),
    );
  }

  Widget selectAllBtn(BuildContext context){
    return Container(


      child: Consumer(
          builder: (BuildContext context, CartProvider provider, Widget child){
            return Row(
              children: <Widget>[
                Checkbox(
                    value: provider.isAllCheck,
                    activeColor: Colors.pink,
                    onChanged: (bool val){
                      Provider.of<CartProvider>(context, listen: false).changeAllCheckModels(!provider.isAllCheck);
                    }
                ),
                Text('全选')
              ],
            );
          }
      ),
    );
  }

  Widget allPriceArea(BuildContext context){

    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36)
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Consumer(
                  //
                    builder: (BuildContext context, CartProvider provider, Widget child){
                      return Text(
                        '¥${provider.allPrice}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(36),
                          color: Colors.red,
                        ),
                      );
                    }
                )
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费,预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget goButton(BuildContext context){

    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Consumer(
              builder: (BuildContext context, CartProvider provider, Widget child) {
                return Text(
                  '结算(${provider.allGoodsCount})',
                  style: TextStyle(
                      color: Colors.white
                  ),
                );
              }
          )
        ),
      ),
    );
  }

}