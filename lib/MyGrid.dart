import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3
    ,crossAxisSpacing: 3.0,mainAxisSpacing: 3.0,childAspectRatio: 0.7),
        children: <Widget>[
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
          new Image.network("http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg",fit: BoxFit.cover,),
        ],
    );
  }
}