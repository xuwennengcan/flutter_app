import 'package:flutter/material.dart';
import 'package:flutter_app/beans/BannerBean.dart';
import 'package:flutter_app/widgets/BannerWidget.dart';

import 'BottomFrameAnimationImage.dart';


void main() => runApp(new WidgetLearn());

class WidgetLearn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetLearnState();
  }

}

class _WidgetLearnState extends State<WidgetLearn>
    with SingleTickerProviderStateMixin {

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


  //banner图片
  List<BannerBean> _bannerList = [];

  //Tab控制器
  TabController _tabController;

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

    _bannerList.add(BannerBean.createBannerBean(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551440172573&di=cba5745b137f49b1f76b6733cfd8b3fb&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F012e1159963329a8012156039f99be.jpg%402o.jpg'
        , "使用alignment配合FractionalOffset：对于FractionalOffset的参数，我是这么理解的：相当于比例，第一个代表横向的权重，第二个代表竖向的权重，横0.9代表在横向十分之九的位置，竖0.1代表在竖向十分之一的位置"));
    _bannerList.add(BannerBean.createBannerBean(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551440172573&di=cba5745b137f49b1f76b6733cfd8b3fb&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F012e1159963329a8012156039f99be.jpg%402o.jpg'
        , "这个函数严格意义上来讲不属于生命周期的一部分，因为这个时候State的widget属性为空，无法在构造函数中访问widget的属性 。但是构造函数必然是要第一个调用的。可以在这一部分接收前一个页面传递过来的数据。"));

    _tabController = new TabController(length: 5, vsync: this);
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
        body: new TabBarView(children: <Widget>[
          new BannerWidget(bannerList: _bannerList,bannerHeight: 100.0,bannerDuration: 300,
             ),

        ], controller: _tabController,),

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