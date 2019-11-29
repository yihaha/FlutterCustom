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
//    _animation = Tween(begin: 10.0, end: 200.0).animate(_controller)
//      ..addListener(() {
//        setState(() {});
//      })
//      ..addStatusListener((status) {
//        print('$status');
//        if (status == AnimationStatus.completed) {
//          _controller.reverse();
//        } else if (status == AnimationStatus.dismissed) {
//          _controller.forward();
//        }
//      });
    ///并行动画
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
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
        ///并行动画
        child: AnimatedRed2(_animation),

        ///方式3
//        child: YAnimaBuilder(
//          child: FlutterLogo(),
//          animation: _animation,
//        ),

        ///方式2
//        child: AnimatedRed(_animation),

        ///方式1
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

///AnimatedWidget方式
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

///AnimatedWidget方式 并行动画
class AnimatedRed2 extends AnimatedWidget {
  final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  final _sizeTween = Tween<double>(begin: 20.0, end: 188.0);

  AnimatedRed2(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> _animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(_animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(_animation),
          width: _sizeTween.evaluate(_animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

///AnimatedBuilder方式
class YAnimaBuilder extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  YAnimaBuilder({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
