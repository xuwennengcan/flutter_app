import 'dart:async';
import 'package:flutter/material.dart';

//自定义的顶部提醒控件

class TopReminder extends StatefulWidget{
  final String reminderText;
  TopReminder({
    @required
    this.reminderText,
  });

  @override
  State<StatefulWidget> createState() {
    return _TopReminderState();
  }

}

class _TopReminderState extends State<TopReminder>{

  _press(String string){
    print(string);
  }

  @override
  Widget build(BuildContext context) {
      return GestureDetector(

        onTap: (){
          _press("press tap");
        },

        onDoubleTap: (){
          _press("press double");
        },

        onLongPress: (){
          _press("press long");
        },

        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            height: 85.0,
            color: const Color(0xffff0000),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.reminderText,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: const Color(0xff00ff00)
                ),
              )
            ),
          ),

          Opacity(
              opacity: 0.5,
              child: Container(
                height: 4.0,
                color: const Color(0xffcccccc),
              ),),

        ],),
      );
  }

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(Duration(seconds: 2),(){
      Navigator.of(context).pop(true);
    });
  }

  void _cancelTimer(){
    _timer?.cancel();
  }

}
