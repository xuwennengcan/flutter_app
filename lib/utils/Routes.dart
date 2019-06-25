import 'package:flutter/material.dart';

///跳转到新的页面
void routeWithName(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

///跳转并且替换当前页面
void routeWithReplaceName(BuildContext context, String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}

///跳转并替换当前页，可直接传参数
void routeWithReplace(BuildContext context, Widget widget) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => widget));
}

///指将当前页面pop，然后跳转到制定页面（将当前路由弹出导航器，并将命名路由推到它的位置）
void routeWithPopPush(BuildContext context, String routeName) {
  Navigator.popAndPushNamed(context, routeName);
}

