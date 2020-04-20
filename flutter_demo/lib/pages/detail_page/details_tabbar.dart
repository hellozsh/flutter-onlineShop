import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';

class DetailTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Consumer<DetailsInfoProvide>(
        builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {

            return Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[

                      _myTabBarLeft(context, detailInfo.isLeft, 0),
                      _myTabBarLeft(context, !detailInfo.isLeft, 1),
                    ],
                  )
                ],
              ),
            );
          },

      ),


    );
  }

  Widget _myTabBarLeft(BuildContext context, bool isChose, int index){

    var title = index == 0? '详细': '评论';
    return InkWell(
      onTap: (){
        if(index == 0) {
          Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftChose(true);
        } else {
          Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftChose(false);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isChose?Colors.pink:Colors.black12
            )
          )
        ),
        child: Text(

          title,
          style: TextStyle(
            color: isChose?Colors.pink:Colors.black
          ),
        ),
      ),
    );
  }
}