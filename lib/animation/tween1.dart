import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///补间动画
class TweenAni1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TweenAni1();
}

class _TweenAni1 extends State<TweenAni1> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _animation = Tween(begin: 10.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print('$status');
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward(); //开始动画
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRed(_animation),

//        Container(
//          color: Colors.white,
//          margin: EdgeInsets.symmetric(vertical: 10.0),
//          child: Container(
//            height: _animation.value,
//            width: _animation.value,
//            color: Colors.redAccent,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedRed extends AnimatedWidget {
  AnimatedRed(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> _animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: _animation.value,
        width: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
