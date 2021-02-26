import 'package:flutter/material.dart';

import 'CityModel.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  static Widget getListItem(BuildContext context, CityModel model,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.name),
      onTap: () {
        print("onItemClick : $model");
        Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }

  static Widget getWeChatListItem(
    BuildContext context,
    ContactInfo model, {
    double susHeight = 40,
    Color defHeaderBgColor,
  }) {
    return getWeChatItem(context, model, defHeaderBgColor: defHeaderBgColor);
  }

  static Widget getWeChatItem(
    BuildContext context,
    ContactInfo model, {
    Color defHeaderBgColor,
  }) {
    DecorationImage image;
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          color: model.bgColor ?? defHeaderBgColor,
          image: image,
        ),
        child: model.iconData == null
            ? null
            : Icon(
                model.iconData,
                color: Colors.white,
                size: 20,
              ),
      ),
      title: Text(model.name),
      onTap: () {
        print("onItemClick : $model");
        Utils.showSnackBar(context, 'onItemClick : ${model.name}');
      },
    );
  }
}
