import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new StatefulWidgetDemo("hello world"));

class StatefulWidgetDemo extends StatefulWidget {
  final String text;

  StatefulWidgetDemo(this.text);

  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetDemoState(text);
  }
}

// _代表private
class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  String text;

  _StatefulWidgetDemoState(this.text);

  @override
  void initState() {
    //初始化，理论上只会调用一次，但是有特殊情况
    super.initState();
    //定时器2秒
    new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        text = "change text";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xffff0000),//颜色值
      alignment: Alignment.center,//居中
      child: Text(
        text ?? "this is StatefulWidget",
        textDirection: TextDirection.ltr,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

}
