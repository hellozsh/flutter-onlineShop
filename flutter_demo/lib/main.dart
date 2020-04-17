import 'package:flutter/material.dart'; // UiKit
import './pages/index_page.dart';

import './pages/simpProvide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:provide/provide.dart' as oldProvide;

import 'package:flutter_demo/provider/providerUse.dart';

import './routers/routes.dart';
import './routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';

// Widget（小部件）
// 有状态的 stateful
// 无状态   stateless
// build方法 --> 渲染


// 如果只有一行代码可以这么写
//void main() => runApp(providerApp());




// 多行代码写法
void main() {

  var counter = Counter();
  var childCategory = ChildCategory();
  var categoryGoodListProvide = CategoryGoodsListProvide();

  var prviders = oldProvide.Providers();
  prviders
    ..provide(oldProvide.Provider<Counter>.value(counter))
    ..provide(oldProvide.Provider<ChildCategory>.value(childCategory))
    ..provide(oldProvide.Provider<CategoryGoodsListProvide>.value(categoryGoodListProvide));

  runApp(oldProvide.ProviderNode(
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider<DetailsInfoProvide>(create: (_)=>DetailsInfoProvide())
          ],
          child: MyApp(),
      ),
      providers: prviders)
  );

}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        debugShowCheckedModeBanner: false,
        //----------------router主要代码start
        onGenerateRoute: Application.router.generator,
        //----------------router主要代码end
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