import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './counter.dart';

class CartNumPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton()
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provide<Counter>(
      builder: (context, child, counter) {
        return Text('${counter.value}', style: Theme.of(context).textTheme.display1,);
      },
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增'),
      ),
    );
  }
}