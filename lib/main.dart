import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mechat/socket/ClientSocket.dart';
import 'package:provide/provide.dart';

import 'App.dart';
import 'Home.dart';
import 'common/Console.dart';
import 'socket/SocketProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{



  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    return MaterialApp(
      debugShowCheckedModeBanner: false,// 是否显示右上角的debug
      theme: appTheme,
      home: App(),
      // 添加路由信息
      routes: <String, WidgetBuilder> {
        'app' : (BuildContext context) {
          return new App();
        },
        'home' : (BuildContext context) {
          return new Home();
        },
      },
    );
  }

  @override
  void initState() {

    //初始化设置 LogUtil
    LogUtil.init(isDebug: true);

    new ClientSocket().connect(context);

    /*Socket.connect('127.0.0.1', 21212).then((socket){
      socket.listen((event) {
        Console.info('onDone');
      },onDone: (){
        Console.info('onDone');
      },
          onError: (e){
            Console.info('onError-$e');
          },
          cancelOnError: true);
    });*/
  }
}

// 自定义主题，绿色小清新风格
final ThemeData appTheme = new ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
