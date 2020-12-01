import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechat/common/TouchCallBack.dart';
import 'package:mechat/common/message_package_type_util.dart';
import 'package:mechat/page/chat/MessageData.dart';

class MessageItem extends StatefulWidget {
  
  final MessageData message;
  MessageItem({Key key, this.message}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {

  final double _itemContainerHeight = 64.0;
  final MessagePackageTypeUtil packageTypeUtil = new MessagePackageTypeUtil();

  @override
  Widget build(BuildContext context) {

    String messagePackageType = this.packageTypeUtil.typeConvent(widget.message.packageType);
    print("消息类型：");
    print(widget.message.packageType);
    print(messagePackageType);

    return Container(
      // color: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12)),
      ),   
      height: _itemContainerHeight,
      child: TouchCallback(
        onPressed: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 13.0,right: 13.0),
              child: Image.network(widget.message.avatar, width: 48.0,height: 48.0,),
              decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey[300],
                ),
              ]),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.message.title,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      maxLines: 1,
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text(
                      messagePackageType == null ? widget.message.subTitle : messagePackageType,
                      style: TextStyle(fontSize: 15.0,color: Colors.black38),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    margin: EdgeInsets.only(right: 0.0, top: _itemContainerHeight/4 ),
                    child: Text(formatDate(widget.message.time, [HH, ':', nn , ':', 'ss']), style: TextStyle(fontSize: 14.0, color: Colors.black38),),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.only(right: 0.0, top: _itemContainerHeight/12 ),
                    child: Icon(Icons.ten_k, color: Colors.black12,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}