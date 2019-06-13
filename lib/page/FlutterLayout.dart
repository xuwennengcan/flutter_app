import 'package:flutter/material.dart';

void main() => runApp(FlutterLayout());

//Flutter布局
class FlutterLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlutterLayoutState();
  }
}

class _FlutterLayoutState extends State<FlutterLayout> {
  @override
  Widget build(BuildContext context) {
    return newColumn();
  }
}

//Container布局
Widget newContainer() {
  return Container(
    //四周margin为20
    margin: EdgeInsets.all(20),
    //内容居中显示
    alignment: Alignment.center,
    //透明黑色遮罩
    decoration: new BoxDecoration(
      //设置了decoration的color，就不能设置Container的color
        color: Colors.blue,
        //弧度为4
        borderRadius: BorderRadius.all(Radius.circular(4)),
        //边框
        border: new Border.all(color: Colors.yellow, width: 5)),
    child: Text(
      "this is text by Container !!! ",
      textDirection: TextDirection.ltr,
    ),
  );
}

Widget newColumn() {
  return Column(
    //主轴居中，竖直方向居中
    mainAxisAlignment: MainAxisAlignment.center,
    //大小按最小显示
    mainAxisSize: MainAxisSize.min,
    //横向轴也居中
    crossAxisAlignment: CrossAxisAlignment.center,
    //子Widget
    children: <Widget>[
      new Expanded(
        child: new Text(
          "this is first expanded",
          textDirection: TextDirection.ltr,
        ),
      ),
      new Expanded(
        child: new Text(
          "this is second expanded",
          textDirection: TextDirection.ltr,
        ),
      )
    ],
  );
}
