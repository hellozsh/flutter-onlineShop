import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/provider/cart.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartCount extends StatelessWidget {

  var item;
  CartCount(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12)
      ),
      child: Row(
        children: <Widget>[

          _reduceBtn(context),
          _countArea(context),
          _addBtn(context),
        ],
      ),
    );
  }

  Widget _reduceBtn(BuildContext context){

    return InkWell(
      onTap: (){
        if(item.count == 1){

          Fluttertoast.showToast(
              msg: "不能再少啦",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );

        }else{
          item.count--;
          Provider.of<CartProvider>(context, listen: false).changeInfoModel(item);
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }
  
  Widget _addBtn(BuildContext context){
    
    return InkWell(
      onTap: (){
        item.count++;
        Provider.of<CartProvider>(context, listen: false).changeInfoModel(item);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }
  
  Widget _countArea(BuildContext context){
    
    return Consumer(
        builder: (BuildContext context, CartProvider provider, Widget child){
          return Container(
            width: ScreenUtil().setWidth(70),
            height: ScreenUtil().setHeight(45),
            alignment: Alignment.center,
            color: Colors.white,
            child: Text('${item.count}'),
          );
        }
    );
  }
}