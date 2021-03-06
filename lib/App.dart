import 'package:flutter/material.dart';
import 'package:mechat/page/AppCenter.dart';
import 'package:mechat/page/LXPhotosData.dart';
import 'package:mechat/page/contants/ContactsPage.dart';
import 'package:mechat/page/contants/PageScaffold.dart';
import 'package:mechat/page/contants/contacts_list_page.dart';

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
    // 1 : new Contacts(), //联系人页面
    1 : new ContactsPage(showAppBar: true,showAzAll: false,), //联系人页面
    // 1 : new ContactListPage(showAppBar: true,), //联系人页面
    2 : new AppCenter(list: [ LXPhotosData('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000', ''),
      LXPhotosData('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000', ''),
      LXPhotosData('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000', ''),
      LXPhotosData('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000', ''),
      LXPhotosData('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000', ''),],),//应用中心
    3 : new Personal(),//我的页面
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
      backgroundColor: Color.fromRGBO(242,241,246, 1),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(icon: Icon(Icons.chat), label: '聊天'),
          new BottomNavigationBarItem(icon: Icon(Icons.person_search), label: '联系人'),
          new BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: '应用中心'),
          new BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
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