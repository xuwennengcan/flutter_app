import 'package:flutter/material.dart';
import 'package:flutter_app/MyList.dart';

void main() => runApp(new App());

class App extends StatefulWidget{
  @override
  MyApp createState() {
    return new MyApp();
  }

}

class MyApp extends State<App> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Are My Love',
      home: Scaffold(
          appBar: new AppBar(title: new Text("ListTile"),),
          body: MyList()
      ),
    );
  }

}
