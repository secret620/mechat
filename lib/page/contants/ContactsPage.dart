import 'package:common_utils/common_utils.dart';

import 'index.dart';

class ContactsPage extends StatefulWidget {
  bool showAppBar;

  ContactsPage( {this.showAppBar : true} );

  @override
  _ContactsPageState createState( ) {
    LogUtil.v('是否显示appBar ${showAppBar}');
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  //所有数据（固定头部数据）
  List<ContactInfo> contactList = [];
  //固定头部数据
  List<ContactInfo> topList = [];

  @override
  void initState() {
    super.initState();
    topList.add(ContactInfo(
        name: '新的朋友',
        tagIndex: '↑',
        bgColor: Colors.orange,
        iconData: Icons.person_add));
    topList.add(ContactInfo(
        name: '群聊',
        tagIndex: '↑',
        bgColor: Colors.green,
        iconData: Icons.people));
    topList.add(ContactInfo(
        name: '标签',
        tagIndex: '↑',
        bgColor: Colors.blue,
        iconData: Icons.local_offer));
    topList.add(ContactInfo(
        name: '公众号',
        tagIndex: '↑',
        bgColor: Colors.blueAccent,
        iconData: Icons.person));
    loadData();
  }

  /*
   * 异步加载assets里json文件数据
   * 这里可以换成使用http获取远程数据
   */
  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('assets/data/car_models.json').then((value) {
      print('加载联系人列表${value}');
      List list = json.decode(value);
      list.forEach((v) {
        contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(contactList);
    });
  }

  /*
   处理加载后的数据
   。汉字转拼音
   。排序
   */
  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) {
      return;
    }
    for (int i = 0, length = list.length; i < length; i++) {
      ContactInfo contactInfo = list[i];

      String pinyin = PinyinHelper.getPinyinE(contactInfo.name);
      contactInfo.namePinyin = pinyin;

      String tag = pinyin.substring(0, 1).toUpperCase();

      LogUtil.v(': ${contactInfo.name}/${pinyin}/${tag}');

      LogUtil.v(': 正则校验转换后的首字母是否A-Z');
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    LogUtil.v(': A-Z sort 排序前 ${list.asMap()}');
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contactList);
    LogUtil.v(': A-Z sort 排序后 ${list.asMap()}');

    // show sus tag. 列表页是否显示 分区 A-Z
    SuspensionUtil.setShowSuspensionStatus(contactList);

    // add topList.
    contactList.insertAll(0, topList);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEDEDED),
        title: Text(
          'Contants',
          style: TextStyle(color: Color(0xFF171717)),
        ),
      ):null,
      body: AzListView(
        data: contactList,// 数据
        itemCount: contactList.length, // 长度
        itemBuilder: (BuildContext context, int index) { //构建列表
          ContactInfo model = contactList[index];
          return Utils.getWeChatListItem(
            context,
            model,
            defHeaderBgColor: Color(0xFFE5E5E5),
          );
        },
        /*
        ScrollPhysics的作用是 确定可滚动控件的物理特性， 常见的有以下四大金刚：
          BouncingScrollPhysics ：允许滚动超出边界，但之后内容会反弹回来。
          ClampingScrollPhysics ： 防止滚动超出边界，夹住 。
          AlwaysScrollableScrollPhysics ：始终响应用户的滚动。
          NeverScrollableScrollPhysics ：不响应用户的滚动。
         */
        physics: BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          if ('↑' == model.getSuspensionTag()) {
            return Container();
          }
          return Utils.getSusItem(context, model.getSuspensionTag());// 列表分区 A-Z widget
        },
        indexBarData: ['↑', '☆', ...kIndexBarData],
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          ignoreDragCancel: true,
          downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
          downItemDecoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          indexHintWidth: 120 / 2,
          indexHintHeight: 100 / 2,
          indexHintDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Utils.getImgPath('ic_index_bar_bubble_gray')),
              fit: BoxFit.contain,
            ),
          ),
          indexHintAlignment: Alignment.centerRight,
          indexHintChildAlignment: Alignment(-0.25, 0.0),
          indexHintOffset: Offset(-20, 0),
        ),
      ),
    );
  }
}