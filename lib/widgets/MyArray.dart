import 'package:flutter/material.dart';

class MyArray extends StatelessWidget {

  _pressButton(context,String string) {
    print(string);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("竖直",style: TextStyle(fontSize: 18.0,decoration: TextDecoration.underline,wordSpacing: 15.0),),
                  new Column(
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击绿色按钮");}, color: Colors.green,child: new Text("绿色按钮"),padding: EdgeInsets.all(10.0),),
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击红色按钮");}, color: Colors.red,child: new Text("红色按钮"),padding: EdgeInsets.all(10.0),),
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击黄色按钮");}, color: Colors.yellow,child: new Text("黄色按钮"),padding: EdgeInsets.all(10.0),)
                    ],
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("水平",style: TextStyle(fontSize: 18.0,decoration: TextDecoration.underline,wordSpacing: 15.0),),
                  new Row(
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击绿色按钮");}, color: Colors.green,child: new Text("绿色按钮"),padding: EdgeInsets.all(10.0),),
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击红色按钮");}, color: Colors.red,child: new Text("红色按钮"),padding: EdgeInsets.all(10.0),),
                      new RaisedButton(
                        onPressed: (){_pressButton(context,"点击黄色按钮");}, color: Colors.yellow,child: new Text("黄色按钮"),padding: EdgeInsets.all(10.0),)
                    ],
                  )
                ],
              )
            ]
    );
  }
}