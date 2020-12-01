import 'package:flutter/material.dart';

import 'page/Contacts.dart';
import 'page/MessagePage.dart';
import 'page/Personal.dart';
import 'page/test_page.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //当前选中的页面索引
  int _currentIndex = 0;
  Map<int, Widget> pages = Map.from({
    0 : new MessagePage(),//聊天页面
    1 : new Contacts(), //好友页面
    2 : new Personal(),//我的页面
    3 : new TestPage(),//我的页面
  });

  //好友页面
  Contacts _contacts;
  //聊天页面
  MessagePage _messagePage;
  //我的页面
  Personal _personal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天'),
          new BottomNavigationBarItem(icon: Icon(Icons.person_search), label: '好友'),
          new BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
          new BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: '测试'),
        ],
        onTap: (index){
          print('${index}');
          setState(() { this._currentIndex = index; });
        },
      ),
      body: buildPage(),
    );
  }

  Widget buildPage(){
    return this.pages[this._currentIndex];
  }
}