import 'package:flutter/material.dart';

void main() => runApp(RouterDemo());

class RouterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Container(
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("New Route"),
          ),
          body: Center(
            child: Text("This is new route"),
          ),
        ),
      ),
    );
  }
}
