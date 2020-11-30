import 'package:flutter/material.dart';

import 'App.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// 是否显示右上角的debug
      title: '聊天室',
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
}

// 自定义主题，绿色小清新风格
final ThemeData appTheme = new ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
