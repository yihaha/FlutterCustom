import 'package:flutter/material.dart';
import 'package:fluttercustom/textbuttion.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'animation/tween1.dart';
import 'utils/route_util.dart';

class DirectoryPage extends StatelessWidget {
  final List<String> directoryList = ["动画", "网络和HTTP", "JSON与序列化", "本地存储与数据库"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Custom"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButtion(
              directoryList[0],
              onClick: onClickToPage(context, directoryList[0], 0),
            ),
            SizedBox(
              height: 25,
            ),
            TextButtion(
              directoryList[1],
              onClick: onClickToPage(context, directoryList[1], 1),
            ),
            SizedBox(height: 25),
            TextButtion(
              directoryList[2],
              onClick: onClickToPage(context, directoryList[2], 2),
            ),
            SizedBox(
              height: 25,
            ),
            TextButtion(
              directoryList[3],
              onClick: onClickToPage(context, directoryList[3], 3),
            ),
          ],
        ),
      ),
    );
  }

  Function onClickToPage(BuildContext context, String content, int index) =>
      () {
        showToast(content);
        RouteUtil.push(context, TweenAni1());
      };

  void showToast(String content) {
    Fluttertoast.showToast(msg: content);
  }
}
