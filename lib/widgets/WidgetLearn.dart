import 'package:flutter/material.dart';

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
        getTabImage('images/drawable-xxhdpi/tag_icon_radio_chick.png'),
        getTabImage('images/drawable-xxhdpi/tag_icon_radio_default.png'),

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

  Text getTabText(int currentIndex) {
    if (_tab_index == currentIndex) {
      return new Text(_tab_titles[currentIndex],
        style: new TextStyle(fontSize: 10.0, color: const Color(0xffFF495C)),);
    } else {
      return new Text(_tab_titles[currentIndex],
        style: new TextStyle(fontSize: 10.0, color: const Color(0xff999999)),);
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 25.0, height: 25.0,);
  }

  Image getTabIcon(int currentIndex) {
    if (_tab_index == currentIndex) {
      return _tab_images[currentIndex][1];
    } else
      return _tab_images[currentIndex][0];
  }

  List<BottomNavigationBarItem> getBottoms(int total) {
    var list = List<BottomNavigationBarItem>();
    for(int i=0;i<total;i++){
      list.add(new BottomNavigationBarItem(icon: getTabIcon(i), title: getTabText(i)));
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