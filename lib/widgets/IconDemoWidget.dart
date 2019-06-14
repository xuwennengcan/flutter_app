import 'package:flutter/material.dart';

class IconDemoWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconDemoWidget({Key key, this.iconData, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        newIcon(iconData),
        new Padding(padding: EdgeInsets.all(10)),
        newText(text)
      ],
    ));
  }
}

Widget newIcon(IconData icon) {
  return new Directionality(
      textDirection: TextDirection.ltr, child: new Icon(icon));
}

Widget newText(String text) {
  return new Text(
    text ?? "text",
    textDirection: TextDirection.ltr,
  );
}
