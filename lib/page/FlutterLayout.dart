import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/IconDemoWidget.dart';

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
    return _demoPage();
  }
}

///Container布局
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

///Column
Widget newColumn() {
  return Column(
    //主轴居中，竖直方向居中
    mainAxisAlignment: MainAxisAlignment.center,
    //大小按最小显示
    mainAxisSize: MainAxisSize.max,
    //横向轴也居中
    crossAxisAlignment: CrossAxisAlignment.center,
    //子Widget
    children: <Widget>[
      new Expanded(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            "this is first expanded",
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
      new Expanded(
        child: new Text(
          "this is second expanded",
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      ),
      new Material(
        child: new Directionality(
            textDirection: TextDirection.ltr,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "this is row",
                  textDirection: TextDirection.ltr,
                ),
                new IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                    onPressed: () {
                      print("hello");
                    })
              ],
            )),
      )
    ],
  );
}

///一个页面的开始
///如果是新页面，会自带返回键
Widget _demoPage() {
  return MaterialApp(
    home: new Scaffold(
      ///背景样式
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        ///标题
        title: new Text("Flutter"),
      ),

      ///正式的页面
      ///创建一个集合,item20个
      body: new ListView.builder(
        itemBuilder: (_, index) {
          return _iconDemoWidget();
        },
        itemCount: 20,
      ),
    ),
  );
}

///IconDemoWidget
Widget _iconDemoWidget() {
  ///卡片布局
  return new Card(
    color: Colors.greenAccent,
    child: new Directionality(
      ///可点击的按钮
      child: new FlatButton(
        ///水平布局
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            IconDemoWidget(
              text: "998",
              iconData: Icons.star,
            ),
            IconDemoWidget(
              text: "58",
              iconData: Icons.mail,
            ),
            IconDemoWidget(
              text: "1000",
              iconData: Icons.face,
            )
          ],
        ),

        ///点击事件
        onPressed: () {
          print("点击了");
        },
        padding: EdgeInsets.all(5),
      ),
      textDirection: TextDirection.ltr,
    ),
  );
}
