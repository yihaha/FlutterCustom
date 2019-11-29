import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercustom/animation/stagger_animation.dart';
import 'package:fluttercustom/animation/tween1.dart';
import 'package:fluttercustom/utils/route_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../directory.dart';
import '../textbuttion.dart';
import 'hero_animation.dart';

class AnimationDirectory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimaDirState();
}

class AnimaDirState extends State<AnimationDirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          //滑动到底部
          padding: EdgeInsets.symmetric(vertical: 10.0),
          //回弹效果
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              TextButtion(
                "普通动画",
                onClick: onClickToPage(context, "普通动画", TweenAni1()),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "路由跳转动画",
//                onClick: onClickToPage(context, directoryList[1], 1),
                onClick: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 666),
                          pageBuilder: (context, animation, animation2) {
                            return FadeTransition(
                              opacity: animation,
                              child: DirectoryPage(),
                            );
                          }));
                },
              ),
              SizedBox(height: 25),
              TextButtion(
                "Hero动画",
                onClick: onClickToPage(context, "Hero动画", HeroAniPage()),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "交织动画",
                onClick: onClickToPage(context, "交织动画", StaggerRoute()),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "动画1",
//                onClick: onClickToPage(context, directoryList[3], 3),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "动画1",
//                onClick: onClickToPage(context, directoryList[3], 3),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "动画1",
//                onClick: onClickToPage(context, directoryList[3], 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Function onClickToPage(BuildContext context, String content, Widget widget) =>
    () {
      showToast(content);
      RouteUtil.push(context, widget);
    };

void showToast(String content) {
  Fluttertoast.showToast(msg: content);
}
