import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/model/cartInfoModel.dart';
import 'package:flutter_demo/pages/cart_page/cart_count.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/cart.dart';

class CartItem extends StatelessWidget {

  final CartInfoMode item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(item);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[

          _cartCheckBt(context,item),
          _cartImage(context,item),
          _cartGoodsName(context,item),
          _cartPrice(context,item),
        ],
      ),
    );
  }

  Widget _cartCheckBt(BuildContext context,item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val){

          item.isCheck = val;
          Provider.of<CartProvider>(context, listen: false).changeInfoModel(item);
        },
      )
    );
  }

  Widget _cartImage(BuildContext context,item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0,color: Colors.black12)
      ),
      child: Image.network(item.images),
    );
  }

  Widget _cartGoodsName(BuildContext context,item){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount()
        ],
      ),
    );
  }

  Widget _cartPrice(BuildContext context,item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,

      child: Column(
        children: <Widget>[
          Text('¥${item.price}'),
          Container(
            child: InkWell(
              onTap: (){
                Provider.of<CartProvider>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}