

import 'dart:convert';
import 'dart:ui';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:github_language_colors/github_language_colors.dart';

class CityModel extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;

  CityModel({
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  CityModel.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
    'name': name,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}

class ContactInfo extends ISuspensionBean {
  /*
   显示的名称
   */
  String name;
  /*
   汉字转拼音后的首字母
   */
  String tagIndex;
  /*
   汉字转拼音全称
   */
  String namePinyin;
  /*
   背景色
   */
  Color bgColor;
  /*
   对应的icon图标
   */
  IconData iconData;
  /*
   图片url?
   */
  String img;
  String id;
  String firstletter;

  ContactInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
    this.bgColor,
    this.iconData,
    this.img,
    this.id,
    this.firstletter,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        id = json['id']?.toString(),
        firstletter = json['firstletter'];

  Map<String, dynamic> toJson() => {
//        'id': id,
    'name': name,
    'img': img,
//        'firstletter': firstletter,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}

class Languages extends GithubLanguage with ISuspensionBean {
  String tagIndex;
  String pinyin;
  String shortPinyin;

  Languages.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = super.toJson();
    void addIfNonNull(String fieldName, dynamic value) {
      if (value != null) {
        map[fieldName] = value;
      }
    }

//    addIfNonNull('tagIndex', tagIndex);
    return map;
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}

class Colours {
  static const Color gray_33 = Color(0xFF333333);
  static const Color gray_66 = Color(0xFF666666);
  static const Color gray_99 = Color(0xFF999999);
}
