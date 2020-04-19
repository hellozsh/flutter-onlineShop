import 'package:flutter/material.dart';
import './simpProvide/CartNumPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<String> testList = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 500.0,
            child: ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(testList[index]),
                  );
                }
            ),
          ),
          RaisedButton(
            onPressed: (){_add();},
            child: Text('增加'),
          ),
          RaisedButton(
            onPressed: (){_clear();},
            child: Text('清空'),
          )
        ],
      ),
    );
  }

  void _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = "😂哈哈哈";
    testList.add(temp);
    prefs.setStringList('testInfo', testList);
    _show();
  }

  void _show() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getStringList('testInfo')!=null){
        testList = prefs.getStringList('testInfo');
      }
    });
  }
  void _clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('testInfo');
    setState(() {
      testList = [];
    });
  }
}