import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/TopReminder.dart';

class MyList extends  StatelessWidget{

  _clickThis(context){
    openTopReminder(context, reminderText);
  }

  final String reminderText = "你的操作有误，请重新选择，如果不这样做，你会被我打的";

  void openTopReminder(context,String reminder){
    Navigator.of(context).push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context,_,__){
              return TopReminder(reminderText: reminder);
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
       new ListTile(
         leading: new Icon(Icons.work),
         title: new Text("let us go to work"),
         onTap: (){
           print(reminderText);
           _clickThis(context);
         },
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