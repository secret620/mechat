import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            appBar: AppBar(
              title: Text('即时通讯'),
              actions: <Widget>[
                GestureDetector(
                  onTap: (){
                    print('onTap');
                  },
                  child: Icon(Icons.search),
                )
              ],
            ),
            body: Center(
              child: Text('Hello World'),
            ),
        )
    );
  }
}