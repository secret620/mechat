import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
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
    // return Center(
    //   child: Container(
    //     child: Container(
    //       padding: EdgeInsets.all(10.0),
    //       margin: EdgeInsets.all(10.0),
    //       decoration: new BoxDecoration(
    //         color: Color(0xFF9E9E9E),
    //         borderRadius: new BorderRadius.circular((7.0)),
    //       ),
    //       height: 250.0,
    //       child: GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: this.widget.currentCrossAxisCount,
    //           crossAxisSpacing: this.widget.crossAxisPaddingSize,
    //           mainAxisSpacing: this.widget.mainAxisPaddingSize,
    //         ),
    //         itemBuilder: (BuildContext context, int index){
    //           return GestureDetector(
    //             child: Hero(
    //               // tag: widget.list[index].imgUrl,
    //               tag: index,
    //               child: Container(
    //                 width: 20.0,
    //                 height: 20.0,
    //                 // color: widget.bgColor,
    //                 color: Colors.orangeAccent,
    //                 child: Container(
    //                   color: Colors.red,
    //                 ),
    //                 // child: ClipRRect(
    //                 //   borderRadius: BorderRadius.circular(widget.radiusSize),
    //                 //   // child: Image(
    //                 //   //   width: 10.0,
    //                 //   //   height: 10.0,
    //                 //   //   image: NetworkImage(widget.list[index].imgUrl),
    //                 //   //   fit: BoxFit.fitWidth,
    //                 //   // ),
    //                 //
    //                 // ),
    //               ),
    //             ),
    //             onTap: () {
    //               Navigator.of(context).push(PageRouteBuilder(
    //                   pageBuilder: (context,animation, secondaryAnimation) {
    //                     return FadeTransition(
    //                         opacity: animation,
    //                         child: LXScrollPhotosView(currentIndex: index,currentList: widget.list,)
    //                     );
    //                   }
    //               )
    //               );
    //             } ,
    //           );
    //         },
    //         itemCount: widget.list.length,
    //       ),
    //     )
    //   ),
    // );
    // return this.getBBWidget(context);
    // return this.gets();
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
      body: this.hot(),
    );
  }

  Widget hot(){
    Widget c =  Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(10.0),),
      ),
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        mainAxisAlignment : MainAxisAlignment.start,
        mainAxisSize : MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 40,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(51,149,250, 1),
              borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0),),
            ),
            child: Text('热门应用', style: TextStyle(fontSize: 18.0),),
          ),
          Container(
            color: Colors.yellow,
            child:   buildGridView1(),
          )
        ],
      ),
    );
    return c;
  }

  Widget gets(){
    List<Container> _buildGuidTitleList(int count) {
      return List<Container>.generate(
        count,(int index) => Container(
          // child: Image.network('https://inews.gtimg.com/newsapp_bt/0/12853014573/1000'),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              // color: Colors.red,
              child: Container(
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(51,149,250, 1),
                  borderRadius: new BorderRadius.circular((7.0)),
                ),
                child: Center(
                  child: IconButton(icon: Icon(Icons.table_chart,color: Colors.white,), iconSize : 35.0, onPressed: (){
                    LogUtil.v('点击');
                  }),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),//EdgeInsets.only(top: 0.0, left: 10.0, bottom: 10.0,right: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular((7.0)),
      ),
      height: 230.0,
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.extent(
              shrinkWrap: true,
              //次轴的宽度
              maxCrossAxisExtent: 100,
              //次轴的宽度
              padding: EdgeInsets.all(1.0),
              //上下左右的内边距
              mainAxisSpacing: 5.0,
              //主轴元素间距
              crossAxisSpacing: 5.0,
              //次轴元素间距
              children: _buildGuidTitleList(8), //添加
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget getBBWidget(BuildContext context) {
    var ScreenW = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10.0),
        height: 200,
        width: ScreenW,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular((7.0)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(51,149,250, 1),
                  borderRadius: new BorderRadius.circular((7.0)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: Center(
                    child: IconButton(icon: Icon(Icons.table_chart,color: Colors.white,), iconSize : 35.0, onPressed: (){
                      LogUtil.v('点击');
                    }),
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(51,149,250, 1),
                  borderRadius: new BorderRadius.circular((7.0)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: Center(
                    child: IconButton(icon: Icon(Icons.table_chart,color: Colors.white,), iconSize : 35.0, onPressed: (){
                      LogUtil.v('点击');
                    }),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  ///通过构造函数来创建
  Widget buildGridView1() {
    return GridView(
      shrinkWrap: true,
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //横轴元素个数
          crossAxisCount: 4,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4
      ),
      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }


  List<Widget> buildListViewItemList(){
    List<Widget> list = [];
    ///模拟的8条数据
    for (int i = 0; i < 12; i++) {
      list.add(buildListViewItemWidget(i));
    }
    return list;
  }

  ///创建GridView使用的子布局
  Widget buildListViewItemWidget(int index) {
    return new Container(
      ///内容剧中
      alignment: Alignment.center,

      ///根据角标来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }
}
