import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mechat/common/TouchCallBack.dart';
import 'package:mechat/page/chat/MessageData.dart';

class MessageItem extends StatefulWidget {
  
  final MessageData message;
  MessageItem({Key key, this.message}) : super(key: key);

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12)),
      ),   
      height: 64.0,
      child: TouchCallback(
        onPressed: (){},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 13.0,right: 13.0),
              child: Image.network(widget.message.avatar, width: 48.0,height: 48.0,),
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.message.title,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      maxLines: 1,
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text(
                      widget.message.subTitle,
                      style: TextStyle(fontSize: 14.0,color: Colors.black38),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(right: 12.0, top: 12.0),
              child: Text(formatDate(widget.message.time, [HH, ':', nn , ':', 'ss']), style: TextStyle(fontSize: 14.0, color: Colors.black38),),
            )
          ],
        ),
      ),
    );
  }
}