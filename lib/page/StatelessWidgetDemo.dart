import 'package:flutter/material.dart';

void main() => runApp(new StatelessWidgetDemo(null));

class StatelessWidgetDemo extends StatelessWidget {
  final String text;

  StatelessWidgetDemo(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: new Text(
        text ?? "这是无状态的Demo",
        softWrap: true,
        maxLines: 3,
        style: new TextStyle(fontSize: 12, color: Colors.white),
        textDirection: TextDirection.ltr,
      ),
    );
  }

}
