import 'dart:async';

import 'package:flutter/material.dart';

///刷新控件：①下拉刷新 ②上拉加载更多

class RefreshWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RefreshWidgetState();
  }
}

class _RefreshWidgetState extends State<RefreshWidget> {
  ///滑动控制器
  final ScrollController _scrollController = ScrollController();

  ///列表数量
  var _itemCount = 15;

  ///刷新回调
  Future<Null> _refresh() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _itemCount = 15;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _itemCount += 15;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///刷新控件
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.blue,

      ///创建一个列表
      child: ListView.builder(
        itemBuilder: (context, index) {
          print("index=$index");

          ///相等时，显示加载更多控件
          if (index == _itemCount) {
            return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("加载中..."),
            );
          } else {
            ///显示列表
            return ListTile(
              title: Text("item.............$index............."),
            );
          }
        },
        controller: _scrollController,
        itemCount: _itemCount + 1,
      ),
      onRefresh: _refresh,
    );
  }
}
