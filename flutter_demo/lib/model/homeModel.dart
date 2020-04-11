import 'dart:convert' show json;

class HomeContext {

  String ret;
  List<HomeData> data;
  List<HomeEncryption> encryption;

  HomeContext({
    this.ret,
    this.data,
    this.encryption,
  });

  static HomeContext fromJson(jsonRes) {
    if(jsonRes == null) return null;

    List<HomeData> data = jsonRes['data'] is List ? [] : null;
    if(data != null) {
      for(var item in jsonRes['data']) {
        if(item != null) {
          data.add(HomeData.fromJson(item));
        }
      }
    }

    List<HomeEncryption> encryption = jsonRes['encryption'] is List ? [] : null;
    if(encryption != null) {
      for(var item in jsonRes['encryption']) {
        if(item != null) {
          encryption.add(HomeEncryption.fromJson(item));
        }
      }
    }

    return HomeContext(

      ret: jsonRes['ret'],
      data: data,
      encryption: encryption,
    );
  }

  Map<String, dynamic> toJson() => {
    'ret':ret,
    'data': data,
    'encryption' : encryption,
  };

  @override
  String toString() {
    // TODO: implement toString
    return json.encode(this);
  }
}

class HomeData {

  String pageId;
  String pageName;
  String bgStartColor;
  String bgEndColor;

  List<HomeData_bgImage> bgImg;
  List<HomeData_pageData> pageData;

  HomeData({

    this.pageId,
    this.pageName,
    this.bgStartColor,
    this.bgEndColor,
    this.bgImg,
    this.pageData,
  });

  static HomeData fromJson(jsonRes) {

    if (jsonRes == null) return null;

    List<HomeData_bgImage> bgImg =
    jsonRes['bg_img'] is List ? [] : null;
    if (bgImg != null) {
      for (var item in jsonRes['bg_img']) {
        if (item != null) {
          bgImg.add(HomeData_bgImage.fromJson(item));
        }
      }
    }

    List<HomeData_pageData> pageData = jsonRes['page_data'] is List ? [] : null;
    if (pageData != null) {
      for (var item in jsonRes['page_data']) {
        if (item != null) {
          pageData.add(HomeData_pageData.fromJson(item));
        }
      }
    }
    return HomeData(

      pageId: jsonRes['page_id'],
      pageName: jsonRes['page_name'],
      bgStartColor: jsonRes['bg_start_color'],
      bgEndColor: jsonRes['bg_end_color'],
      bgImg : bgImg,
      pageData: pageData,
    );
  }

  Map<String, dynamic> toJson() => {
    'page_id':pageId,
    'page_name':pageName,
    'bg_start_color':bgStartColor,
    'bg_end_color':bgEndColor,
    'bg_img':bgImg,
    'page_data':pageData,
  };

  @override
  String toString() {
    // TODO: implement toString
    return json.encode(this);
  }
}

class HomeData_bgImage {

  String img_url;
  String height;
  String width;
  String img_type;

  static HomeData_bgImage fromJson(jsonRes) {


  }
}

class HomeData_pageData {

  String id;

  List<HomeData> data;

  static HomeData_pageData fromJson(jsonRes) {

  }
}


class HomeEncryption {

  static HomeEncryption fromJson(jsonRes) {


  }
}