import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DetailWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer<DetailsInfoProvide>(
        builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {

          if(detailInfo.isLeft){
            return Container(
              child: Html(
                  data: """${detailInfo.goodsInfo.data.goodInfo.goodsDetail}"""
              ),
            );
          } else {
            return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text('暂时没有数据'),
            );
          }
        }
    );
  }
}
