

class CategoryPageTitle {
  String id;
  String name;
  String parentId;

  CategoryPageTitle({this.id, this.name, this.parentId});

  factory CategoryPageTitle.fromJson(dynamic json) {
    return CategoryPageTitle(
        id : json['id'].toString(),
        name : json['name'],
        parentId : json['parent_id'].toString()
    );
  }
}

class CategoryPageTitleList {

  List<CategoryPageTitle> list;
  CategoryPageTitleList(this.list);
  factory CategoryPageTitleList.formJson(List json){
    return CategoryPageTitleList(
        json.map((i)=>CategoryPageTitle.fromJson((i))).toList()
    );
  }
}