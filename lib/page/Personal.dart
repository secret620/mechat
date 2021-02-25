import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

import 'FullIconButton.dart';

class Personal extends StatefulWidget {
  Personal({Key key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {

  @override
  Widget build(BuildContext context) {
    //状态栏黑色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: new Container(
        color: Colors.grey[100],
        child: new Column(
          children: [
            new Container(
              height: 250.0,
              width: double.infinity,
              // color: Colors.red[200],
              color: Colors.white,
              child: new Row(
                children: [
                  // Image.network('https://www.baidu.com/img/flexible/logo/pc/result.png')
                  this.createHeaderImage(),
                  this.createHeaderInfo('空指针', '2312313xsxdf'),
                ],
              ),
            ),
            this.createNev('支付', Icons.payments, Colors.green, top: 10.0, bottom: 10.0),
            this.createNev('收藏', Icons.check_box_outline_blank, Colors.orangeAccent ),
            this.createNev('朋友圈', Icons.map_outlined, Colors.blue ),
            this.createNev('卡包', Icons.credit_card_rounded, Colors.blue ),
            this.createNev('表情', Icons.tag_faces, Colors.amber ),
            this.createNev('设置', Icons.settings, Colors.blue, top: 10.0, bottom: 10.0),
            
            Container(
              height: 100.0,
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: BorderSide(
                    width: 0.0,//宽度
                    color: Colors.grey[300], //边框颜色
                  ),
                ),
                color: Colors.white,
              ),
              child: MaterialButton(
                ///按钮的背景
                color: Colors.blue,
                minWidth: double.infinity,
                height: double.infinity,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.volume_up),
                    onPressed: null,
                  ),
                ),
                onPressed: (){
                  print('xx');
                },
              ),
            ),

            TextButton.icon(
              onPressed: (){
                print('xxx');
              },
              icon: Icon(Icons.volume_up),
              label: new Text('data'),
              style: ButtonStyle(
                //设置按钮的大小
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 100)),
                //设置按钮内边距
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //设置按下时的背景颜色
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue[200];
                  }
                  //默认不使用背景颜色
                  return null;
                }),
              ),
            ),

            FullIconButton(
              label: Text("GitHub登录2",),
              height: 55.0,
              color: Colors.white,
              textColor: Colors.white,
              onPressed: () {},
              minWidth: double.infinity,
              leftIcon: Icon(Icons.volume_up),
              // rightIcon: Icon(Icons.group),
              // topIcon: Text("我是👆"),
              // bottomIcon: Text("我是👇"),
              textPadding: EdgeInsets.only(left: 10, right: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget createNev(String name, IconData iconData, Color color, {double top:0.0, double bottom:0.0}){
    print(top);
    print(top == 0);
    return new Container(
      decoration: new BoxDecoration(
        border: ( top != 0 ? null : new Border(
            bottom: BorderSide(
              width: 0.0,//宽度
              color: Colors.grey[300], //边框颜色
            ),
          )
        ),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: top, bottom: bottom),
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      height: 55.0,
      width: double.infinity,
      child: new Row(
        children: [
          this.nev(name, iconData, color),
        ],
      ),
    );
  }

  Widget nev(String name, IconData iconData, Color color){
    return new Row(
      children: [
        Icon(
          iconData,
          color: color,
        ),
        new Container(
          margin: const EdgeInsets.only(left: 3.0),
          child: Text(name, style: new TextStyle(fontSize: 17.0,),),
        )
      ],
    );
  }

  Widget createHeaderInfo(String name, String idCode){
    return Stack(
      children: [
        new Align(
          alignment: FractionalOffset(0.5, 0.45),
          child: new RichText(
            text: TextSpan(
                text: name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
        ),
        new Align(
          alignment: FractionalOffset(0.5, 0.60),
          child: new RichText(
            text: TextSpan(
                text: 'ID：'+idCode,
                style: TextStyle(
                  color: Colors.black45,
                )
            ),
          ),
        ),
      ],
    );
  }

  double imageWidth = 80.0;
  double imageHeight = 80.0;
  Widget createHeaderImage(){
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: imageWidth,
        height: imageHeight,
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
          color: Color(0xFF9E9E9E),
          borderRadius: new BorderRadius.circular((7.0)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: FractionalOffset(0.5, 0.5),
              child: Image.network(
                // 'https://avatar.csdnimg.cn/6/5/F/3_beyondforme_1551163884.jpg',
                'https://inews.gtimg.com/newsapp_bt/0/12853014573/1000',
                // fit: BoxFit.fill,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      )
    );
  }
}