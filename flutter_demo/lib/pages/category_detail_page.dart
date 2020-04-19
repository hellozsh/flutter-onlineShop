import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';
import 'package:flutter_demo/pages/detail_page/detail_explain.dart';
import 'package:flutter_demo/pages/detail_page/detail_top_area.dart';
import 'package:flutter_demo/pages/detail_page/details_tabbar.dart';
import 'package:flutter_demo/pages/detail_page/details_web.dart';
import 'package:flutter_demo/pages/detail_page/detail_bottom.dart';

class DetailPage extends StatelessWidget {
  
  final String goodsId;
  DetailPage(this.goodsId);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              print('返回上一页');
              Navigator.pop(context);
            }
        ),
        title: Text('商品详细页'),
      ),
      body: FutureBuilder(

          future: _getBackInfo(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[

                      DetailTopArea(),
                      DetailsExplain(),
                      DetailTabBar(),
                      DetailWeb(),
                    ],
                  ),
                  Positioned(
                    child: DetailBottom(),
                    bottom: 0,
                    left: 0,
                  )
                ],
              );
            }else{
              return Text("记载中.....");
            }
          }
      ),
    );
  }
  
  Future _getBackInfo(BuildContext context)async{
    await Provider.of<DetailsInfoProvide>(context, listen: false).getGoodsInfo("1");
    return "加载完成";
  }

  // http://rest.apizza.net/mock/5dd3071030912e35521d7984fd5389fb/
}