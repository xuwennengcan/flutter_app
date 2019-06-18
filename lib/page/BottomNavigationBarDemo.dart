import 'package:flutter/material.dart';

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
  ///页面控制器
  var _pageController = new PageController();

  ///当前页面下标
  var _currentPage = 0;

  ///页面
  var _pageWidgets = [
    newPage("首页"),
    newPage("社区"),
    newPage("消息"),
    newPage("我的")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        ///标题
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("BottomNavigationBar"),
        ),

        ///主体
        body: PageView(
          controller: _pageController,
          children: _pageWidgets,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),

        ///底部按钮
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          items: getBottoms(_currentPage),
          onTap: (index) {
            _currentPage = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
      ),
    );
  }
}

///底部按钮集合
List<BottomNavigationBarItem> getBottoms(int currentPage) {
  return [
    getBottom(0, currentPage, Icons.home, "首页"),
    getBottom(1, currentPage, Icons.comment, "社区"),
    getBottom(2, currentPage, Icons.message, "消息"),
    getBottom(3, currentPage, Icons.my_location, "我的")
  ];
}

///获取底部按钮
BottomNavigationBarItem getBottom(
    int index, int currentPage, IconData icon, String text) {
  var color;
  if (index == currentPage)
    color = Colors.red;
  else
    color = Colors.black26;
  return BottomNavigationBarItem(
      icon: newIcon(color, icon),
      title: Text(
        text,
        style: TextStyle(color: color),
      ));
}

///创建一个Icon
Widget newIcon(Color color, IconData icon) {
  return Icon(
    icon,
    color: color,
  );
}

///新的页面
Widget newPage(String text) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      text,
    ),
  );
}
