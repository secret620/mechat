import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:mechat/common/GridViewMenu.dart';
import 'package:mechat/common/GridViewPanelModel.dart';
import 'package:mechat/common/IconButton.dart';
import 'package:mechat/common/IconText.dart';
import 'package:mechat/common/PanelGridViewMenu.dart';
import 'package:mechat/page/LXScrollPhotosView.dart';
import 'package:mechat/page/contants/index.dart';

import 'LXPhotosData.dart';

class AppCenter extends StatefulWidget {
  //数据资源
  final List<LXPhotosData> list;
  //主轴间距
  final double mainAxisPaddingSize;
  //交叉轴间距
  final double crossAxisPaddingSize;
  // 圆角大小(默认没有圆角)
  final double radiusSize;
  //交叉轴个数 (默认值 根据九宫格个数决定)
  final int currentCrossAxisCount;
  //背景颜色
  final Color bgColor;

  AppCenter(
      {Key key,
      @required this.list,
      this.mainAxisPaddingSize = 5,
      this.crossAxisPaddingSize = 5,
      this.radiusSize = 0.0,
      this.bgColor = Colors.white,
      int currentCrossAxisCount})
      : this.currentCrossAxisCount =
            currentCrossAxisCount ?? (list.length == 4 ? 2 : 3),
        super(key: key);

  @override
  _AppCenterState createState() => _AppCenterState();
}

class _AppCenterState extends State<AppCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242,241,246, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // backgroundColor: Color(0xFFEDEDED),
        title: Text(
          '应用中心',
          style: TextStyle(color: Color(0xFF171717)),
        ),
      ),
      // body: this.gets(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            PanelGridViewMenu(
              header : GridViewPanelModel(
                panelTitle: '热门应用',
                panelTitleTextStyle: TextStyle(color: Colors.white),
                panelTitleIcon: Icon(Icons.whatshot_sharp, color: Colors.white,),
              ),
              data: <GridViewMenu> [
                new GridViewMenu('读取短信', iconData: Icons.message,click: (){LogUtil.v('读取短信');}),
                new GridViewMenu('读取通讯录', icon : Icon(Icons.contact_phone,),iconContainerBackgroundColor: Color.fromRGBO(255,148,60, 1)),
                new GridViewMenu('扫描二维码', icon : Icon( IconData(0xe819, fontFamily: 'alibabaicon'),),iconContainerBackgroundColor: Color.fromRGBO(254,172,0, 1)),
                new GridViewMenu('支付宝支付', icon : Icon( IconData(0xe934, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('微信支付', icon : Icon( IconData(0xe958, fontFamily: 'alibabaicon'),),iconContainerBackgroundColor: Color.fromRGBO(6,192,95, 1)),
              ],
            ),

            PanelGridViewMenu(
              autoHeight: true,
              header : GridViewPanelModel(
                panelTitle: '组件',
                panelTitleTextStyle: TextStyle(color: Colors.white),
                panelTitleIcon: Icon(Icons.whatshot_sharp, color: Colors.white,),
              ),
              data: <GridViewMenu> [
                new GridViewMenu('Web浏览', icon : Icon( IconData(0xe959, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('视频播放', icon : Icon( IconData(0xe8fb, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('图片预览', icon : Icon( IconData(0xe9d2, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('选择相册', icon : Icon( IconData(0xe831, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('手机网络类型', icon : Icon( IconData(0xe83c, fontFamily: 'alibabaicon'),)),
                new GridViewMenu('手机系统', icon : Icon( IconData(0xe7a3, fontFamily: 'alibabaicon'),)),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
