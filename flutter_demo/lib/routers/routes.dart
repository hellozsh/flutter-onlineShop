import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes{

  static String root = '/';
  static String detailPage = "/detail";

  static String twoClassPage = "/twoClass";
  static String scaffoldPage = "/scaffold";

  static void configureRoutes(Router router){
    router.notFoundHandler= new Handler(
        handlerFunc: (BuildContext context,Map<String,List<String>> params){
          print('ERROR====>ROUTE WAS NOT FONUND!!!');
          return Text('handlerFunc ERROR');
        }
    );
    router.define(detailPage, handler: detailHanderl);
    router.define(twoClassPage, handler: twoClassHanderl);
    router.define(scaffoldPage, handler: scaffoldHanderl);
  }
}