
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTopArea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(2.0),
        child: Consumer<DetailsInfoProvide>(
          builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {
            print("zhusuhua ===== detailInfo = "+detailInfo.goodsInfo.toString());

            var goodsInfo = detailInfo.goodsInfo;
            if(goodsInfo != null) {
              return Column(
                children: <Widget>[
                _goodsImage(detailInfo.goodsInfo.data.goodInfo.image1),
                _goodsName(detailInfo.goodsInfo.data.goodInfo.goodsName),
                _goodsNum(detailInfo.goodsInfo.data.goodInfo.goodsSerialNumber),
                _goodsPrice(detailInfo.goodsInfo.data.goodInfo.presentPrice,detailInfo.goodsInfo.data.goodInfo.oriPrice),
                ],
              );
            }else{
              return Text('正在加载中....');
            }

          }
        )
      );
  }


  // 商品图片
  Widget _goodsImage(url){
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _goodsName(name){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  // 编号方法
  Widget _goodsNum(num){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text('编号${num}',
        style: TextStyle(
            color: Colors.black26
        ),),
    );
  }

  // 商品价格方法
  Widget _goodsPrice(presentPrice, oriPrice){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '¥${presentPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            '市场价:¥${oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }

}

