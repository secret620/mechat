
import 'package:mechat/page/chat/MessagePackageType.dart';
import 'package:mechat/page/chat/MessageType.dart';

class MessageData {
  //头像
  String avatar;

  //主标题
  String title;

  //子标题
  String subTitle;

  //消息时间
  DateTime time;

  //消息类型
  MessageType type;

  MessagePackageType packageType;

  MessageData(
      this.avatar, this.title, this.subTitle, this.time, this.type, this.packageType);
}