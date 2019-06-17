import 'package:flutter/material.dart';

///这是一个图文的icon按钮
class IconDemoWidget extends StatelessWidget {
  ///图标
  final IconData iconData;

  ///文字
  final String text;

  const IconDemoWidget({Key key, this.iconData, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Expanded均分Row、Column
    return new Expanded(

        ///水平方向布局
        child: new Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        newIcon(iconData),

        ///设置间距
        new Padding(padding: EdgeInsets.all(5)),
        newText(text)
      ],
    ));
  }
}

///Icon
Widget newIcon(IconData icon) {
  return new Directionality(
      textDirection: TextDirection.ltr, child: new Icon(icon));
}

///文字
Widget newText(String text) {
  return new Text(
    text ?? "text",
    textDirection: TextDirection.ltr,
  );
}
