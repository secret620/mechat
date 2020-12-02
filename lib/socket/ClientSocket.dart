

import 'dart:async';
import 'dart:io';

import 'package:mechat/common/Console.dart';

class ClickSocket {

  bool clickSocketStatus = false;
  Timer reconnectTimer;
  Socket clientScoket ;

   void connect() async {
    if(!clickSocketStatus){
      await Socket.connect('127.0.0.1', 8080).then((socket){
        Console.info('连接成功-$socket');

        this.clientScoket = socket;
        this.clickSocketStatus = true;

        //listen(void onData(T event)?,
        //{Function? onError, void onDone()?, bool? cancelOnError});
        socket.listen(
            dataHandler,
            onDone: (){
              Console.info('onDone');
              this.doneHandler();
            },
            onError: (e){
              Console.info('onError-$e');
            },
            cancelOnError: true
        );
      }).catchError((e) {
        Console.info('socket无法连接: $e');
      });
    }else{
      Console.info('socket 通道正常');
    }

  }

  // 接收socket返回报文
  dataHandler(data) async {
     Console.info('-------Socket发送来的消息-------$data');
  }

  // Socket出现断开的问题
  void doneHandler(){
    this.clickSocketStatus = false;
    Console.info('原先socket=${clientScoket}');
    clientScoket.close();
    clientScoket.destroy();
    reconnectSocket();          //调用重连socket方法
  }
  // 重新连接socket
  void reconnectSocket() {
    int count = 0;
    const period = const Duration(seconds: 1);
    // 定时器
    reconnectTimer = Timer.periodic(period, (timer) {
      // 每一次重连之前，都删除关掉上一个socket
      count++;
      if(!this.clickSocketStatus && count >= 3){
        Console.info('准备开启重新链接');
        this.connect();
        count = 0;                // 倒计时设置为0
        Console.info('倒计时设置为0');
        timer.cancel();           // 关闭倒计时
        Console.info('关闭倒计时');
        timer = null;             // 清空倒计时
        Console.info('清空倒计时');
      }
    });
  }

}

void main(){
  ClickSocket clickSocket = new ClickSocket();
  clickSocket.connect();
}