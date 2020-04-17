import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider/category_detail_info.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer<DetailsInfoProvide>(
        builder: (BuildContext context, DetailsInfoProvide detailInfo, Widget child) {

          return Container(
            child: Html(
                data: detailInfo.goodsInfo.data.goodInfo.goodsDetail
            ),
          );
        }
    );
  }
}
