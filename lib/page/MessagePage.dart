import 'package:flutter/material.dart';
import 'package:mechat/page/chat/message_item.dart';

import 'chat/MessageData.dart';
import 'chat/MessageType.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  List<MessageData> messageDatas = [
    new MessageData (
        'https://www.baidu.com/img/flexible/logo/pc/result.png',
        '一休哥',
        '突然想到的',
        new DateTime.now(),
        MessageType.CHAT
    ),
    new MessageData (
        'https://www.baidu.com/img/flexible/logo/pc/result.png',
        '一休哥',
        '突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的突然想到的',
        new DateTime.now(),
        MessageType.CHAT
    ),
    new MessageData (
        'https://www.baidu.com/img/flexible/logo/pc/result.png',
        '一休哥',
        '突然想到的',
        new DateTime.now(),
        MessageType.CHAT
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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