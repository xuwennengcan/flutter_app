import 'package:flutter/material.dart';

class BannerBean {
  String image;
  Widget textWidget;

  static BannerBean createBannerBean(String image, String text) {
    BannerBean bean = new BannerBean();
    bean.image = image;
    Text textWidget = new Text(
      text,
      maxLines: 3,
      style: new TextStyle(
          fontSize: 12.0,
          color: Colors.black
      ),
    );

    bean.textWidget = textWidget;
    return bean;
  }

  static String getDetail(String a ,res , {branch = "master"}){
      res = "sb";

  }
}