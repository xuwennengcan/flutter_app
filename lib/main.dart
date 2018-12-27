import 'package:flutter/material.dart';
import 'package:flutter_app/MyGrid.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Your Are My Love',
        home: Scaffold(
          body: MyGrid()
        ),
      );
  }




}
