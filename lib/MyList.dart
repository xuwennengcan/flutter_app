import 'package:flutter/material.dart';

class MyList extends  StatelessWidget{

  _clickThis(){

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
       new ListTile(
         leading: new Icon(Icons.work),
         title: new Text("let us go to work"),
         onTap: _clickThis,
       ),
        new Image.network("http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg"
        ,width: 200.0,height: 200.0,),
        new ListTile(
          leading: new Icon(Icons.home),
          title: Text("let us go home"),
        ),
        new Container(
          width: 180.0,
          height: 180.0,
          color:Colors.deepOrange,
        ),
        new Container(
          width: 100.0,
          height: 100.0,
          color: Colors.deepPurple,
        )
      ],

    );
  }
}