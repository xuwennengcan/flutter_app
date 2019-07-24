import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/RefreshWidget.dart';
import 'package:flutter_app/utils/Routes.dart';
import 'HomePage.dart';

///使用Scaffold+AppBar+BottomNavigationBar+PageView实现简单的页面切换效果
void main() => runApp(BottomNavigationBarDemo());

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

///SingleTickerProviderStateMixin页面切换动画
class _BottomNavigationBarState extends State
    with SingleTickerProviderStateMixin {
  ///当前页面下标
  var _currentPage = 0;

  ///页面
  List<Widget> _pageWidgets;

  @override
  void initState() {
    super.initState();
    _pageWidgets = new List();
    _pageWidgets
      ..add(RefreshWidget())
      ..add(newPage("社区"))
      ..add(newPage("消息"))
      ..add(newPage("我的"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///定义Route
      routes: <String, WidgetBuilder>{
        '/page1': (BuildContext context) => HomePage(),
      },
      home: Scaffold(
        ///标题
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("BottomNavigationBar"),
        ),

        ///主体
        body: IndexedStack(
          index: _currentPage,
          children: _pageWidgets,
        ),

        ///底部按钮
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('首页')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.share), title: Text('社区')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text('消息')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('我的')),
          ],
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}

///新的页面
Widget newPage(String text) {
  return Container(
    alignment: Alignment.center,
    child: GestureDetector(
      child: Text(
        text,
      ),
      onTap: () {
        jumpToAndroid(text);
      },
    ),
  );
}
