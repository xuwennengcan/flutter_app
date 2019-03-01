import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/beans/BannerBean.dart';

//点击事件回调
typedef void onBannerItemClick(int position, BannerBean bean);

typedef Widget CustomBuild(int position, BannerBean bean);

//最大值
const MAX_COUNT = 0x7fffffff;

class BannerWidget extends StatefulWidget {

  final List<BannerBean> bannerList;
  final double bannerHeight;
  final int bannerDuration;
  final onBannerItemClick bannerItemClick;
  final CustomBuild customBuild;

  BannerWidget({Key key,@required this.bannerList, this.bannerHeight, this.bannerDuration,
      this.bannerItemClick, this.customBuild}):super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new _BannerState();
  }

}

class _BannerState extends State<BannerWidget> {

  //时间计时器
  Timer timer;

  //页面控制器
  PageController _pageController;

  //当前下标
  int currentIndex;

  @override
  void initState() {
    super.initState();
    double current = widget.bannerList.length > 0 ? (MAX_COUNT / 2) -
        (MAX_COUNT / 2) % widget.bannerList.length : 0.0;
    _pageController = PageController(initialPage: current.toInt());
    start();
  }

  //启动banner
  start() {
    stop();
    timer =
        Timer.periodic(Duration(milliseconds: widget.bannerDuration), (timer) {
          if (widget.bannerList.length > 0 && _pageController != null &&
              _pageController.page != null) {
            _pageController.animateToPage(
                _pageController.page.toInt() + 1,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          }
        });
  }

  //停止banner
  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    super.dispose();
    stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.bannerHeight,
      color: Colors.orangeAccent,
      child: Stack(
        children: <Widget>[
          getBannerWidget(),
        ],
      ),
    );
  }

  //获取某个Banner Widget
  Widget getBannerWidget() {
    return PageView.builder(
        itemCount: widget.bannerList.length > 0 ? MAX_COUNT : 0,
        controller: _pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () { //触发banner点击事件
              if (widget.bannerItemClick != null) {
                widget.bannerItemClick(index, widget.bannerList[currentIndex]);
              }
            },
            child: widget.bannerList[currentIndex].textWidget,
          );
        }

    );
  }

  onPageChanged(index) {
    currentIndex = index % widget.bannerList.length;
    setState(() {

    });
  }

}