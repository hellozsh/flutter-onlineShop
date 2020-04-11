import 'package:flutter/material.dart'; // UiKit
import './pages/index_page.dart';

// Widget（小部件）
// 有状态的 stateful
// 无状态   stateless
// build方法 --> 渲染


// 如果只有一行代码可以这么写
void main() => runApp(MyApp());

// 多行代码写法
//void main() {
//
//  runApp(
//    MyWidget()
//  );
//}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      )
    );
  }
}

class MyWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
       child: Text(
         'hello Flutter',
         textDirection: TextDirection.ltr,
       ),
    );
  }
}