import 'package:flutter/material.dart';

import 'BottomFrameAnimationImage.dart';


void main() => runApp(new WidgetLearn());

class WidgetLearn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetLearnState();
  }

}

class _WidgetLearnState extends State<WidgetLearn> {

  int _tab_index = 0;
  var _tab_titles = ["首页", "社区", "直播", "消息", "我的"];
  var _tab_images;

  final List<String> _bottomImages = [
    /*'images/bottom-gif/tag_icon_radio_gif_00000.png',
    'images/bottom-gif/tag_icon_radio_gif_00001.png',
    'images/bottom-gif/tag_icon_radio_gif_00002.png',
    'images/bottom-gif/tag_icon_radio_gif_00003.png',
    'images/bottom-gif/tag_icon_radio_gif_00004.png',
    'images/bottom-gif/tag_icon_radio_gif_00005.png',
    'images/bottom-gif/tag_icon_radio_gif_00006.png',
    'images/bottom-gif/tag_icon_radio_gif_00007.png',*/
    'images/bottom-gif/tag_icon_radio_gif_00008.png',
    'images/bottom-gif/tag_icon_radio_gif_00009.png',
    'images/bottom-gif/tag_icon_radio_gif_00010.png',
    'images/bottom-gif/tag_icon_radio_gif_00011.png',
    'images/bottom-gif/tag_icon_radio_gif_00012.png',
    'images/bottom-gif/tag_icon_radio_gif_00013.png',
    'images/bottom-gif/tag_icon_radio_gif_00014.png',
    'images/bottom-gif/tag_icon_radio_gif_00015.png',
    'images/bottom-gif/tag_icon_radio_gif_00016.png',
    'images/bottom-gif/tag_icon_radio_gif_00017.png',
    'images/bottom-gif/tag_icon_radio_gif_00018.png',
    'images/bottom-gif/tag_icon_radio_gif_00019.png',
    'images/bottom-gif/tag_icon_radio_gif_00020.png',
  ];

  void initData() {
    _tab_images = [
      [
        getTabImage('images/drawable-xxhdpi/tag_icon_home_default.png'),
        getTabImage('images/drawable-xxhdpi/tag_icon_home_click.png')
      ],
      [
        getTabImage('images/drawable-xxhdpi/tag_icon_community_default.png'),
        getTabImage('images/drawable-xxhdpi/tag_icon_community_chick.png')
      ],
      [
        BottomFrameAnimationImage(_bottomImages, 32.0, 32.0, 200),
        getTabImage('images/drawable-xxhdpi/tag_icon_radio_click.png'),

      ],
      [
        getTabImage('images/drawable-xxhdpi/tag_icon_information_n.png'),
        getTabImage('images/drawable-xxhdpi/tag_icon_information_s.png')
      ],
      [
        getTabImage('images/drawable-xxhdpi/tag_icon_my_default.png'),
        getTabImage('images/drawable-xxhdpi/tag_icon_my_chick.png')
      ]
    ];
  }

  //获取Tab的文本
  Text getTabText(int currentIndex) {
    if (_tab_index == currentIndex) {
      return new Text(_tab_titles[currentIndex],
        style: new TextStyle(fontSize: 11.0, color: const Color(0xffFF495C)),);
    } else {
      return new Text(_tab_titles[currentIndex],
        style: new TextStyle(fontSize: 11.0, color: const Color(0xff999999)),);
    }
  }

  //获取资源图片
  Widget getTabImage(path) {
    return new Container(
      child: new Image.asset(path, width: 25.0, height: 25.0,),
      width: 32.0,
      height: 32.0,
      alignment: Alignment.center,);
  }

  //获取Tab的图标
  Widget getTabIcon(int currentIndex) {
    if (_tab_index == currentIndex) {
      return _tab_images[currentIndex][1];
    } else
      return _tab_images[currentIndex][0];
  }

  //获取底部导航栏
  List<BottomNavigationBarItem> getBottoms(int total) {
    var list = List<BottomNavigationBarItem>();
    for (int i = 0; i < total; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabText(i)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      home: new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
            items: getBottoms(5),
            type: BottomNavigationBarType.fixed,
            currentIndex: _tab_index,
            onTap: (index) {
              setState(() {
                _tab_index = index;
              });
            }
        ),
      ),

    );
  }

}