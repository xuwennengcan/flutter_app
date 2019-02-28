import 'package:flutter/material.dart';

/**
 * create by can on 2019/2/28
 * Flutter实现帧动画
 */
class BottomFrameAnimationImage extends StatefulWidget {

  final List<String> _assetList; //图片集合
  final double width; //宽度
  final double height; //高度
  int onceTime = 100; //一张图片的执行时间

  BottomFrameAnimationImage(this._assetList, this.width, this.height,
      this.onceTime);

  @override
  State<StatefulWidget> createState() {
    return _BottomFrameAnimationImageState();
  }

}

class _BottomFrameAnimationImageState extends State<BottomFrameAnimationImage>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final imageCount = widget._assetList.length;
    final totalTime = imageCount * widget.onceTime;

    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: totalTime));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.forward(from: 0.0); //重新执行动画
      }
    });

    _animation =
    new Tween<double>(begin: 0.0, end: imageCount.toDouble()).animate(
        _controller)
      ..addListener(() {
        setState(() {

        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> images = [];

    int ix = _animation.value.toInt() % widget._assetList.length; //当前动画的值



    //添加图片至内容
    for (int i = 0; i < widget._assetList.length; i++) {
      if (ix != i) { //不是当前动画隐藏 宽度为0
        images.add(
            new Image.asset(widget._assetList[i], width: 0.0, height: 0.0,));
      }else    //当前动画设置宽度
        images.add(
            new Image.asset(widget._assetList[ix], width: widget.width, height: widget.height,));
    }

    images.add(new Image.asset('images/drawable-xxhdpi/tag_icon_radio_default.png',width: 25.0,height: 25.0,));



    return Stack(
      alignment: AlignmentDirectional.center,
      children: images,
    );
  }

}