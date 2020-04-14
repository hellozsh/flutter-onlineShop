import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/model/category.dart';
import 'package:provide/provide.dart';
import 'package:flutter_demo/provide/child_category.dart';

class RightCategoryNav extends StatefulWidget {

  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Provide<ChildCategory>(
        builder: (context, child, childCategory){
          return Container(
              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(570),
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12)
                  )
              ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: childCategory.childCategoryList.length,
                itemBuilder: (context, index){
                  return _rightInkWell(index,childCategory.childCategoryList[index]);
                }
            ),
          );
        },
      ) 
    );
  } 

  Widget _rightInkWell(int index,CategoryPageTitle item){

    bool isCheck = false;
    isCheck = (index == Provide.value<ChildCategory>(context).childIndex)?true: false;

    return InkWell(
      onTap: (){
        Provide.value<ChildCategory>(context).changeChildIndex(index);
      },
      child: Container(

        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isCheck?Colors.pink:Colors.black,
          ),
        ),
      ),
    );
  }
}