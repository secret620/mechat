import 'dart:async';
import 'dart:io';
import 'package:mechat/common/Console.dart';
import 'SocketProvider.dart';

class ClientSocket {

  bool _clientSocketStatus = false;
  Timer _reconnectTimer;
  Socket _clientSocket ;
  var _context;

   void connect(context) async {
    if(!_clientSocketStatus){
      await Socket.connect('192.168.43.164', 8000).then((socket){
        Console.info('连接成功-$socket');

        this._clientSocket = socket;
        this._clientSocketStatus = true;

        SocketProvider socketProvider = new SocketProvider();
        socketProvider.setSocket(this._clientSocket);
        socketProvider.setNetWorkState('4G', context);

        // var providers = Providers();
        // providers.provide(Provider<SocketProvider>.value(socketProvider));

        // 存储全局socket对象
        // final currentCounter = Provide.value<SocketProvider>(context);

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
      }).timeout(Duration(seconds: 5),onTimeout: (){
        Console.info('timeout');
      }).whenComplete((){
        Console.info('complete');
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
    this._clientSocketStatus = false;
    Console.info('原先socket=${_clientSocket}');
    _clientSocket.close();
    _clientSocket.destroy();
    reconnectSocket();          //调用重连socket方法
  }
  // 重新连接socket
  void reconnectSocket() {
    int count = 0;
    const period = const Duration(seconds: 1);
    // 定时器
    _reconnectTimer = Timer.periodic(period, (timer) {
      // 每一次重连之前，都删除关掉上一个socket
      count++;
      if(!this._clientSocketStatus && count >= 3){
        Console.info('准备开启重新链接');
        this.connect(_context);
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
  ClientSocket clickSocket = new ClientSocket();
  // clickSocket.connect();
}