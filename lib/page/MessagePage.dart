import 'package:flutter/material.dart';
import 'package:mechat/page/chat/MessagePackageType.dart';
import 'package:mechat/page/chat/message_item.dart';

import 'chat/MessageData.dart';
import 'chat/MessageType.dart';
import 'package:mechat/data/MessageDatas.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅聊'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              print('onTap');
            },
            child: Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(220, 220, 220, 0.3),
      body: ListView.builder(
        itemCount: messageDatas.length,
        itemBuilder: (BuildContext context, int index) {
          MessageData messageData = messageDatas[index];
          return new MessageItem(message: messageData,);
        }
      ),
    );
  }
}