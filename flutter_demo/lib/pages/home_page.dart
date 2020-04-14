import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/config/HttpHeader.dart';
import 'package:flutter_demo/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';


class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final List<String> pageIds = [
    "0",
    "93541",
    "93544",
    "93547",
    "93553",
    "93556",
    "93559"
  ];

  int currentPageIdIndex = 0;
  List<Map> hotGoodsList = [];
  List<Map> pageDataList = [];
  List<Map> swiperDataList = [];
  List<Map> navigationDataList = [];
  List<Widget> navigatList = [];
  List<Map> recommendDataList = [];
  List<Map> floorDataList = [];
  String bgImageUrl = "";

  void _getHomeContext() {
    postRequest('homePageContext', formData: homePagePar).then((val) {
      var data = json.decode(val.toString());
      setState(() {
        pageDataList.addAll((data['data']['page_data'] as List).cast());
        swiperDataList = (pageDataList[3]['data'] as List).cast();
        navigationDataList = (pageDataList.first['data'] as List).cast();

        List<Map> leftNvigationDataList = navigationDataList.sublist(0, 10);
        List<Map> rightNvigationDataList = navigationDataList.sublist(0, 10);
        navigatList = [
          TopNavigator(navigatorList: leftNvigationDataList,),
          TopNavigator(navigatorList: rightNvigationDataList,)
        ];

        recommendDataList = (pageDataList[4]['data'] as List).cast();

        floorDataList = (pageDataList[4]['data'] as List).cast();
        floorDataList.add(pageDataList[4]['data'][0]);

        bgImageUrl = data['data']['bg_img']['img_url'];
      });
    });
  }

  // 火爆商品接口
  void _getHotGoods() {
    homePagePar['page_id'] = pageIds[currentPageIdIndex];
    postRequest('homePageBelowConten', formData: homePagePar).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data']['list'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList.sublist(0, 10));
        currentPageIdIndex++;
        if (currentPageIdIndex > pageIds.length) {
          currentPageIdIndex = 0;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHotGoods();
    _getHomeContext();
    print("加载页面");
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),

    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                width: 0.5,
                color: Colors.black12
            )
        )
    ),
  );

  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              print('点击了火爆商品');
            },
            child:
            Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val['img_url'], width: ScreenUtil().setWidth(375),
                    height: ScreenUtil().setHeight(300),),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: ScreenUtil().setSp(26),
                    ),
                  ),
                  Text(
                      '¥${val['ssu_list'][0]['original_price']}(${val['sku_all_format']})'),
                  Text(
                    '¥${val['min_price']}/${val['sku_unit']}',
                  ),
                ],
              ),
            )
        );
      }).toList();
      return Wrap( // 流式布局
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(' ');
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    new EasyRefresh(
      footer: ClassicalFooter(
        bgColor: Colors.white,
        textColor: Colors.pink,
        infoColor: Colors.pink,
        noMoreText: "",
        showInfo: true,
        infoText: "加载中",
        loadReadyText: "上拉加载....",
      ),
    );

    // TODO: implement build
    return EasyRefresh(
      child: ListView(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(500),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bgImageUrl),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                SwiperNavDiy(swiperWidgetList: navigatList,),
                TimeCheap(timeCheapList: swiperDataList,),
              ],
            ),
          ),
          SwiperDiy(swiperDataList: swiperDataList,),
          Recommend(recommendList: recommendDataList,),
          // FloorTitle(picture_address:swiperDataList[0]['img'],),
          // FloorContent(floorGoodsList: floorDataList,),
          _hotGoods(),
        ],
      ),
      onLoad: () async {
        print('开始加载更多');
        _getHotGoods();
      },
    );
  }
}


   @override
//  Widget build(BuildContext context) {
//
////    return EasyRefresh(
////      child: ListView(
////        children: <Widget>[
////
////        ],
////      ),
////    )
//
//    return Scaffold(
//      appBar: AppBar(title: Text('百姓生活+'),),
//      body: FutureBuilder(
//          future: postRequest('homePageContext', formData: homePagePar),
//          builder: (context, snapshot){
//            if(snapshot.hasData){
//
//              var data=json.decode(snapshot.data.toString());
//              List<Map> pageDataList = (data['data']['page_data'] as List).cast();
//
//              List<Map> swiperDataList = (pageDataList[3]['data'] as List).cast();
//
//              List<Map> navigationDataList = (pageDataList.first['data'] as List).cast();
//              List<Map> leftNvigationDataList = navigationDataList.sublist(0,10);
//              List<Map> rightNvigationDataList = navigationDataList.sublist(0,10);
//              List<Widget> navigatList = [TopNavigator(navigatorList: leftNvigationDataList,),TopNavigator(navigatorList: rightNvigationDataList,)];
//
//              List<Map> recommendDataList = (pageDataList[4]['data'] as List).cast();
//
//              List<Map> floorDataList = (pageDataList[4]['data'] as List).cast();
//              floorDataList.add(pageDataList[4]['data'][0]);
//
//              return SingleChildScrollView (
//
//                child: Column(
//                  children: <Widget>[
//
//                    Container(
//                      width: ScreenUtil().setWidth(750),
//                      height: ScreenUtil().setHeight(500),
//                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image:NetworkImage(data['data']['bg_img']['img_url']),
//                          fit: BoxFit.fill,
//                        ),
//                      ),
//                      child: Column(
//                        children: <Widget>[
//                          SwiperNavDiy(swiperWidgetList: navigatList,),
//                          TimeCheap(timeCheapList: swiperDataList,),
//                        ],
//                      ),
//                    ),
//                    SwiperDiy(swiperDataList: swiperDataList,),
//                    Recommend(recommendList: recommendDataList,),
//                   // FloorTitle(picture_address:swiperDataList[0]['img'],),
//                   // FloorContent(floorGoodsList: floorDataList,),
//                    _hotGoods(),
//                  ],
//                ),
//
//
////                child: Container(
////
////                  width: ScreenUtil().setWidth(750),
////                  height: ScreenUtil().setHeight(900),
////                  decoration: BoxDecoration(
//////                  color: Colors.white,
//////                  border: Border.all(width: 2.0),
//////                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
////                    image: DecorationImage(
////                      image:NetworkImage(data['data']['bg_img']['img_url']),
////
////                    ),
////                  ),
////                  child: Column(
////                    children: <Widget>[
////                      SwiperNavDiy(swiperWidgetList: navigatList,),
////                      TimeCheap(timeCheapList: swiperDataList,),
////                      SwiperDiy(swiperDataList: swiperDataList,),
////                    ],
////                  ),
////                ),
//              );
//            }else{
//              return Center(
//                child: Text('加载中'),
//              );
//            }
//          },
//      ),
//    );
//  }
//}

// 获取火爆专区商品方法





// 楼层
class FloorTitle extends StatelessWidget {

  final String picture_address; // 图片地址
  FloorTitle({Key key, this.picture_address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}
// 楼层商品组件
class FloorContent extends StatelessWidget {

  final List floorGoodsList;
  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow(){
    return Row(
      children: <Widget>[

        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map goods){
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){print('点击了楼层商品');},
        child: Image.network(goods['img']),
      ),
    );
  }
}




// 推荐商品
class Recommend extends StatelessWidget {

  final List recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(325),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList()
        ],
      ),
    );
  }

  // 推荐商品标题
  Widget _titleWidget(){

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink
        ),
      ),
    );
  }

  Widget _recommedList(){

    return Container(
      height: ScreenUtil().setHeight(280),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['img']),
          ],
        ),
      ),
    );
  }
}



class TopNavigator extends StatelessWidget {

  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key:key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (){print("点击了导航");},
      child: Column(
        children: <Widget>[
          Image.network(item['img'], width: ScreenUtil().setWidth(95)),
          Text(item['name'])
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       height: ScreenUtil().setHeight(250),
       child: GridView.count(
         crossAxisCount: 5,
         padding: EdgeInsets.all(4.0),
         children: navigatorList.map((item){
           return _gridViewItemUI(context, item);
         }).toList(),
       ),
    );
  }
}

// this.builder: SwiperPagination.dots});
// 导航轮播图
class SwiperNavDiy extends StatelessWidget {

  final List swiperWidgetList;
  SwiperNavDiy({Key key, this.swiperWidgetList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: ScreenUtil().setHeight(280),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return swiperWidgetList[index];
        },
        itemCount: swiperWidgetList.length,
        pagination: SwiperPagination(),
        autoplay: false,
      ),
    );
  }
}

// 限时秒杀
class TimeCheap extends StatelessWidget {

  final List timeCheapList;
  TimeCheap({Key key, this.timeCheapList}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(710),
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2.0, color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            _timeUI(context),
            _gridScrollUI(context),
          ],
        ),
      ),
    );
  }

  Widget _timeUI(BuildContext context) {

    return Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(40),
        child: InkWell(
          onTap: _launchURL,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              border: Border.all(width: 2.0, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
                '限时秒杀',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }

  void _launchURL() async {
    String url = 'https://www.baidu.com/';
    if(await canLaunch(url)){

    }else{
      throw 'Could not launch $url';
    }
  }

  Widget _gridScrollItemUI(BuildContext context, item) {

    return InkWell(
      onTap: (){print("点击了导航");},
      child: Column(
        children: <Widget>[
           Text('菜菜'),
//          Image.network(item['img_url'], width: ScreenUtil().setWidth(95)),
//          Text(item['name'])
        ],
        textDirection: TextDirection.ltr,
      ),
    );
  }

  @override
  Widget _gridScrollUI(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(150),
      child: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(4.0),
        scrollDirection: Axis.horizontal,
        children: timeCheapList.map((item){
          return _gridScrollItemUI(context, item);
        }).toList(),
      ),
    );
  }

}


// 轮播图
class SwiperDiy extends StatelessWidget {

  final List swiperDataList;
  SwiperDiy({Key key, this.swiperDataList}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['img']}", fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

/* service_method的使用
class _HomePageState extends State<HomePage> {

  String homePageContent = '正在获取数据';
  void initState(){
    getHomePageContext().then((val){

      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),
    );
  }
}
 */

// 伪造请求头获取接口数据
/*
class _HomePageState extends State<HomePage> {
  
  String showText = '还没有请求数据';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('请求远程数据'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(onPressed: _jike,child: Text('请求数据')),
              Text(showText)
            ],
          ),
        ),
      ),
    );
  }
  
  void _jike(){
    print('开始向极客时间请求数据..........');
    getHttp().then((val){
      setState(() {
        showText = val['data'].toString();
      });
    });
  }
  
  Future getHttp() async{
    try{
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response = await dio.get("https://time.geekbang.org/serv/v1/column/newAll");
      print(response);
      return response.data;
    } catch(e){
      return print(e);
    }
  }

}
*/

// 动态组件和get请求组合使用
/*
class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你来到美好人间';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('美好人间'),),
        body: Container(
          height: 1000,
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型'
                ),
                autofocus: false,
              ),
              RaisedButton(
                  onPressed: _choseAction,
                  child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choseAction(){
    setState(() {
      showText="开始选择你喜欢的类型.....";
    });
    if(typeController.text.toString() == '') {
       showDialog(
         context: context,
         builder: (context)=>AlertDialog(title: Text('美女类型不能为空'))
       );
    } else {
      getHttp(typeController.text.toString()).then((val){

        setState(() {
          showText=val.toString();
        });
      });
    }
  }

  Future getHttp(String TypeText) async {

    try{

      Response response;
      var data = {'systemApiCatagory': TypeText};
      response = await Dio().get(
        "https://api.test.xzlcorp.com/v0/patient/version/latest",
        queryParameters: data
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}
*/

/*
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getHttp();
    return Container(
      child: Scaffold(
        body: Center(
          child: Text("商城首页"),
        ),
      ),
    );
  }

  void getHttp() async {

     try{
       Response response;
       response = await Dio().get("https://api.test.xzlcorp.com/v0/patient/version/latest?systemApiCatagory=IOS");
       return print(response);
     } catch (e) {

       return print(e);
     }
  }
}
*/