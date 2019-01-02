import 'package:flutter/material.dart';
import 'package:flutter_app/MyRow.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Your Are My Love',
        home: Scaffold(
          appBar: new AppBar(title: new Text("水平方向布局"),),
          body: MyRow()
        ),
      );
  }




}
