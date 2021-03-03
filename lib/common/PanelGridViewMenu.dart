
import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:mechat/common/GridViewMenu.dart';
import 'package:mechat/common/GridViewPanelModel.dart';
import 'package:mechat/page/contants/index.dart';

import 'IconText.dart';

class PanelGridViewMenu extends StatefulWidget{
  bool createPanelHeader = true;
  GridViewPanelModel header;
  List<GridViewMenu> data;
  bool autoHeight ;

  PanelGridViewMenu(
      { Key key,
        this.header,
        this.autoHeight : false,
        @required this.data ,
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _PanelGridViewMenuState();
  }
}

class _PanelGridViewMenuState extends State<PanelGridViewMenu>{

  @override
  Widget build(BuildContext context) {

    if( widget.header != null){
      if(  widget.header.panelTitleTextStyle == null ){
        widget.header.panelTitleTextStyle = new TextStyle(color: Colors.white);
      }
    }else{
      widget.header = new GridViewPanelModel();
      widget.createPanelHeader = false;
      widget.header.panelHeight = widget.header.panelHeight -  widget.header.viewHeight;
    }

    return this.createPanel();
  }

  @override
  void initState() {
    if( widget.data == null){
      throw Exception( 'data is empty' );
    }
    LogUtil.v('widget.header=${widget.header}');
  }

  Widget createPanel(){
    Widget c ;
    if( widget.autoHeight ){
      c  =  Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(10.0),),
        ),
        child: widget.createPanelHeader ? includeHeader() : unIncludeHeader(),
      );
    }else{
      c  =  Container(
        width: double.infinity,
        height: widget.header == null ? 300.0 : widget.header.panelHeight,
        margin: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(10.0),),
        ),
        child: widget.createPanelHeader ? includeHeader() : unIncludeHeader(),
      );
    }
    return c;
  }

  Widget includeHeader(){
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      mainAxisAlignment : MainAxisAlignment.start,
      mainAxisSize : MainAxisSize.max,
      children: [
        cPanel(),
        cMenu()
      ],
    );
  }

  Widget unIncludeHeader(){
    return Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      mainAxisAlignment : MainAxisAlignment.start,
      mainAxisSize : MainAxisSize.max,
      children: [
        cMenu(),
      ],
    );
  }

  Widget cMenu(){
    return Container(
      padding: EdgeInsets.only(top:10.0),
      child:  buildGridView(),
    );
  }

  Widget cPanel(){
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: widget.header == null ? 30.0 : widget.header.viewHeight,
      decoration: new BoxDecoration(
        color: Color.fromRGBO(51,149,250, 1),
        borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0),),
      ),
      child: Row(
        mainAxisAlignment : MainAxisAlignment.start,
        mainAxisSize : MainAxisSize.max,
        children: [
          IconText( widget.header.panelTitle,
            icon: widget.header.panelTitleIcon,
            style: widget.header.panelTitleTextStyle,),
        ],
      ),
    );
  }

  ///通过构造函数来创建
  Widget buildGridView() {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      // Container 包含可滚动控件时自适应宽高。
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
    LogUtil.v('widget.data=${widget.data}');
    for (int i = 0; i < widget.data.length; i++) {
      list.add(buildListViewItemWidget(i, widget.data[i]));
    }
    return list;
  }

  void processData(GridViewMenu gridViewMenu){

    Icon selfIcon = gridViewMenu.icon;
    if( selfIcon != null ){
      gridViewMenu.icon = new Icon(
        selfIcon.icon,
        color: (selfIcon.color == null ? Colors.white : selfIcon.color),
        size: ( selfIcon.size == null ? 30.0 : selfIcon.size ),
        semanticLabel: selfIcon.semanticLabel,
        textDirection: selfIcon.textDirection,
      );
    }
    // String label = gridViewMenu.label;
    // if(label != null){
    //   int length = label.length;
    //   if(length > 5){
    //     gridViewMenu.label = label.substring(0, 5);
    //   }
    // }

    GestureTapCallback click = gridViewMenu.click;
    if(click == null){
      gridViewMenu.click = (){LogUtil.e('unbind click');};
    }

    if(!widget.autoHeight && widget.data.length > 12){
      LogUtil.e('panel menu limit 12 number');
      widget.data = widget.data.sublist(0, 12);
    }
  }

  ///创建GridView使用的子布局
  Widget buildListViewItemWidget(int index, GridViewMenu gridViewMenu) {
    this.processData(gridViewMenu);
    return new Container(
      ///内容剧中
      alignment: Alignment.center,
      ///根据角标来动态计算生成不同的背景颜色
      // color: Colors.cyan[100 * (index % 9)],
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: new Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  padding : EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    color: gridViewMenu.iconContainerBackgroundColor != null ? gridViewMenu.iconContainerBackgroundColor : Color.fromRGBO(51,149,250, 1),
                    borderRadius: new BorderRadius.circular((7.0)),
                  ),
                  child: gridViewMenu.icon != null ? gridViewMenu.icon : new Icon( gridViewMenu.iconData, color: Colors.white,size: 30,),
                ),
                new Container(
                  // margin: const EdgeInsets.only(top: .0),
                  child: new Text(
                    gridViewMenu.label,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(164,165,166, 1),
                    ),
                    maxLines: 1,// 最大一行
                    overflow: TextOverflow.clip,//溢出截取
                  ),
                ),
              ],
            ),
            onTap: gridViewMenu.click,
            // onTap: (){
            //   print('xxxxxxx');
            // },
          ),
        ),
      ),
    );
  }

}