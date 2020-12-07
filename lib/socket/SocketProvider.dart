import 'dart:io';

import 'package:flutter/material.dart';

import 'ClientSocket.dart';

class SocketProvider with ChangeNotifier{
  Socket socket;
  String netWorkStatus = 'none';              // 网络状态

  // 存储socket实例
  setSocket(_socket){
    this.socket = _socket;
  }

  // 设置当前网络状态
  setNetWorkState(val, context) async {
    var socket = new ClientSocket(); // 在这里实例化socket，这里是整个APP的socket调用最开始的地方
    // 只有当之前没有网络的时候，从新有了网络后并且token存在的情况下才会从新触发socket通信
    // 默认的时候是none 所以初始化第一次打开的时候是可以触发的
    if(netWorkStatus == 'none' && (val == '4G' || val == 'Wifi')){
      print('-----------------------------链接socket-------------------------');
      socket.connect(context);
    }
    // 设置网络状态
    netWorkStatus = val;
  }

}