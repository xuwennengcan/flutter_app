import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {

  _pressButton(String string) {
    print(string);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _pressButton("点击绿色按钮"), color: Colors.green,child: new Text("绿色按钮"),padding: ,),
        new RaisedButton(
          onPressed: _pressButton("点击红色按钮"), color: Colors.red,child: new Text("红色按钮"),),
        new RaisedButton(
          onPressed: _pressButton("点击黄色按钮"), color: Colors.yellow,child: new Text("黄色按钮"),)

      ],
    );
  }
}