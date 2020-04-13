import 'package:flutter/material.dart';

import 'package:provide/provide.dart';
import '../pages/simpProvide/counter.dart';

class MemberPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: Center(
          child: Provide<Counter>(
            builder: (context,child,counter){
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ),
      ),
    );
  }
}