
import 'package:flutter_demo/model/entity_factory.dart';

class ResponseEntity<T> {
  String status;
  T data;

  ResponseEntity({this.status, this.data});

  factory ResponseEntity.fromJson(json) {
    return ResponseEntity(
      status: json["status"],
      // data值需要经过工厂转换为我们传进来的类型
      data: EntityFactory.generateOBJ<T>(json["data"]),
    );
  }
}

class ResponseListEntity<T> {
  String status;
  List<T> data;

  ResponseListEntity({this.status, this.data});

  factory ResponseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return ResponseListEntity(
      status: json["status"],
      data: mData,
    );
  }
}