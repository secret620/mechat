
import 'package:mechat/page/chat/MessagePackageType.dart';

class MessagePackageTypeUtil {

  String typeConvent(MessagePackageType type){
    String result ;
    switch(type) {
      case MessagePackageType.FILE: {
        result = "[文件]";
      }
      break;

      case MessagePackageType.LONG_STRING: {
        result = "[文件]";
      }
      break;

      case MessagePackageType.MEDIA: {
        result = "[媒体]";
      }
      break;

      case MessagePackageType.VOICE: {
        result = "[语音]";
      }
      break;

      case MessagePackageType.IMG: {
        result = "[图片]";
      }
      break;

      case MessagePackageType.VIDEO: {
        result = "[视频]";
      }
      break;

      default: {
        result = null;
      }
      break;
    }
    return result;
  }

}