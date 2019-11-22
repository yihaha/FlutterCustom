import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercustom/utils/route_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../textbuttion.dart';

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
                "动画1",
//                onClick: onClickToPage(context, directoryList[0], 0),
              ),
              SizedBox(
                height: 25,
              ),
              TextButtion(
                "动画1",
//                onClick: onClickToPage(context, directoryList[1], 1),
              ),
              SizedBox(height: 25),
              TextButtion(
                "动画1",
//                onClick: onClickToPage(context, directoryList[2], 2),
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
