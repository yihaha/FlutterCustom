import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'directory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      //anroid状态栏颜色统一
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MaterialApp(
      title: 'Flutter Custom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DirectoryPage(),
    );
  }
}
