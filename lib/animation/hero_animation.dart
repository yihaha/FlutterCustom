import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAniPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Text("测试");
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero页面一"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset(
                "images/qiu.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondAnimat) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Hero页面二"),
                  ),
                  body: HeroAniPage2(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroAniPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/qiu.png"),
      ),
    );
  }
}
