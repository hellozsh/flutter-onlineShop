import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  
  final String goodsId;
  DetailPage(this.goodsId);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('商品ID为:${goodsId}'),
    );
  }
  
  void _getBackInfo(BuildContext context)async{
    

  }

  // http://rest.apizza.net/mock/5dd3071030912e35521d7984fd5389fb/
}