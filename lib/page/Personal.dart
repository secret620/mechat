import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/IconButton.dart';

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
            // this.createNev('支付', Icons.payments, Colors.green, top: 10.0, bottom: 10.0),
            // this.createNev('收藏', Icons.check_box_outline_blank, Colors.orangeAccent ),
            // this.createNev('朋友圈', Icons.map_outlined, Colors.blue ),
            // this.createNev('卡包', Icons.credit_card_rounded, Colors.blue ),
            // this.createNev('表情', Icons.tag_faces, Colors.amber ),
            // this.createNev('设置', Icons.settings, Colors.blue, top: 10.0, bottom: 10.0),

            this.createNavButton('支付', Icons.payments, Colors.green, (){
              print('支付');
            }, top: 10.0, bottom: 10.0),
            this.createNavButton('收藏', Icons.check_box_outline_blank, Colors.orangeAccent, (){
              print('收藏');
            }, ),
            this.createNavButton('朋友圈', Icons.map_outlined, Colors.blue, (){
              print('朋友圈');
            }, ),
            this.createNavButton('卡包', Icons.credit_card_rounded, Colors.blue, (){
              print('卡包');
            }, ),
            this.createNavButton('表情', Icons.tag_faces, Colors.amber, (){
              print('表情');
            }, ),
            this.createNavButton('设置', Icons.settings, Colors.blue, (){
              print('设置');
            }, top: 10.0, bottom: 10.0),
          ],
        ),
      ),
    );
  }

  Widget createNavButton(String label, IconData iconData, Color iconColor, VoidCallback callback, {double top:0.0, double bottom:0.0, double right:0.0, double left:0.0}){
    return new Container(
      decoration: new BoxDecoration(
        border: ( top != 0 ? null : new Border(
          bottom: BorderSide(
            width: 1.0,//宽度
            color: Colors.grey[50], //边框颜色
          ),
        )
        ),
        // color: Colors.grey,
      ),
      margin: EdgeInsets.only(top: top, bottom: bottom),
      height: 55.0,
      width: double.infinity,
      child: new FullIconButton(
        label: Text(label,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
        height: 55.0,
        color: Colors.white,
        highlightElevation: 0.0,//阴影
        disabledElevation: 0.0,//阴影
        elevation: 0.0,//阴影
        onPressed: callback,
        minWidth: double.infinity,
        leftIcon: Icon(iconData, color: iconColor,),
        textPadding: EdgeInsets.only(left: 10, right: 10),
        topMargin: top,
        rightMargin: right,
        leftMargin: left,
        bottomMargin: bottom,
      ),
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