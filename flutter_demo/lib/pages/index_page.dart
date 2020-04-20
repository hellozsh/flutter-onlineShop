import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'category_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/currentIndex.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [

    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text("首页")
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text("分类")
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text("购物车")
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text("会员中心")
    )
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

//  int currentIndex = 0;
//  var currentPage;

//  @override
//  void initState() {
//
//    currentPage = tabBodies[currentIndex];
//    _pageController = PageController()
//    ..addListener((){
//      if(currentPage != _pageController.page.round()) {
//        setState(() {
//          currentPage = _pageController.page.round();
//        });
//      }
//    });
//    super.initState();
//  }
  
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 750, height: 1334);
    // TODO: implement build
    return Consumer<CurrentIndexProvide>(
      builder: (BuildContext con, CurrentIndexProvide provider, Widget child){

        return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: provider.currentIndex,
              items: bottomTabs,
              onTap: (index){
//                setState(() {
//                  currentIndex = index;
//                  currentPage = tabBodies[currentIndex];
//                });
               Provider.of<CurrentIndexProvide>(context, listen: false).changeIndex(index);
              },
            ),
            body: IndexedStack(
              index: provider.currentIndex,
              children: tabBodies,
            )
        );
      }
    );
  }
}