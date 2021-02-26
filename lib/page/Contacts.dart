import 'package:flutter/material.dart';

import 'contants/ContactsPage.dart';
import 'contants/PageScaffold.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  int _currentIndex;
  List<String> letters = ["A", "B", "C", "D", "E", "F", "G",
    "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
    "U", "V", "W", "X", "Y", "Z"];
  Color selectAzColor;
  OverlayEntry overlayEntry;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: ListPage([
          PageInfo("Contacts", (ctx) => ContactsPage(showAppBar: false,), true),
        ]),
      ),
    );
  }

  void buildAz() async{
    //创建一个OverlayEntry对象
    overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return this.az();
    });

    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
  }

  Widget az()  {
    return Align(
      alignment: new FractionalOffset(1.0, 0.5),
      child: SizedBox(
        width: 25.0,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top : 20.0),
            child: ListView.builder(
              itemCount: letters.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  child: Container(
                    // color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        height: 20,
                        //设置 child 居中
                        alignment: Alignment(0, 0),
                        decoration: new BoxDecoration(
                          //背景
                          color: Colors.green[200],
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //设置四周边框
                          // border: new Border.all(width: 0, color: Colors.green[200]),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${this.letters[index]}',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                  ),
                  onTap: (){
                    print('${letters[index]}');
                    // setState(() {
                    //   this._currentIndex = index;
                    //   (this._currentIndex == selectIndex)? this.selectAzColor = Colors.green[200] : this.selectAzColor = null;
                    // });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
