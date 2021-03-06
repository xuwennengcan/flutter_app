import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/MyGrid.dart';
import 'package:flutter_app/widgets/MyList.dart';
import 'package:flutter_app/widgets/MyArray.dart';

void main() => runApp(new HomePage());

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() =>new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Flutter"),),
        body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new MyList(),
              new MyGrid(),
              new MyArray(),
            ]),
        bottomNavigationBar: new Material(
          color: Colors.orangeAccent,
          child: new TabBar(
              controller: _tabController,
              tabs: <Tab>[
                new Tab(text: "List",icon: new Icon(Icons.list),),
                new Tab(text: "grid",icon: new Icon(Icons.group),),
                new Tab(text: "array",icon: new Icon(Icons.view_array),)
              ]),
        ),
      ),
    );
  }

}