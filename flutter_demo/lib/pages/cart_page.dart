import 'package:flutter/material.dart';
import './simpProvide/CartNumPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/provider/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/pages/cart_page/cart_bottom.dart';
import 'package:flutter_demo/pages/cart_page/cart_item.dart';

class CartPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    _getCartInfo(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),

      body:Consumer<CartProvider> (

          builder: (BuildContext context, CartProvider cartInfo, Widget child){

            if(cartInfo.cartList != null){

              return Stack(

                children: <Widget>[
                  ListView.builder(
                    itemCount: cartInfo.cartList.length,
                    itemBuilder: (context, index){
                      return CartItem(cartInfo.cartList[index]);
                    },
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: CartBottom()
                  )
                ],
              );

            }else{
              return Text('增在加载');
            }
          },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {

    await Provider.of<CartProvider>(context, listen: false).getCartInfo();
    return 'end';
  }

}



// 持久化示范
//class CartPage extends StatefulWidget {
//
//  _CartPageState createState() => _CartPageState();
//}
//
//class _CartPageState extends State<CartPage> {
//
//  List<String> testList = [];
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Container(
//            height: 500.0,
//            child: ListView.builder(
//                itemCount: testList.length,
//                itemBuilder: (context, index){
//                  return ListTile(
//                    title: Text(testList[index]),
//                  );
//                }
//            ),
//          ),
//          RaisedButton(
//            onPressed: (){_add();},
//            child: Text('增加'),
//          ),
//          RaisedButton(
//            onPressed: (){_clear();},
//            child: Text('清空'),
//          )
//        ],
//      ),
//    );
//  }
//
//  void _add() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String temp = "😂哈哈哈";
//    testList.add(temp);
//    prefs.setStringList('testInfo', testList);
//    _show();
//  }
//
//  void _show() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      if(prefs.getStringList('testInfo')!=null){
//        testList = prefs.getStringList('testInfo');
//      }
//    });
//  }
//  void _clear() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove('testInfo');
//    setState(() {
//      testList = [];
//    });
//  }
//}