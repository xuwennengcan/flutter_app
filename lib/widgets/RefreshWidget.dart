import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  ///是否需要加载更多
  var _needMore = true;

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
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _itemCount += 15;
          });
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
        itemBuilder: (context, position) {
          print("index=$position");

          ///相等时，显示加载更多控件
          if (position == _itemCount) {
            return _buildMoreWidget();
          } else {
            ///显示列表
            return ListTile(
              title: Text("position.............${position + 1}............."),
            );
          }
        },
        controller: _scrollController,
        itemCount: _itemCount + 1,
      ),
      onRefresh: _refresh,
    );
  }

  //加载更多样式
  Widget _buildMoreWidget() {
    var moreWidget = _needMore
        ? new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///loading框
              SpinKitRotatingCircle(
                size: 14,
                color: Colors.blue,
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "加载中...",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        : Container();
    return Padding(padding: const EdgeInsets.all(10), child: moreWidget);
  }
}
