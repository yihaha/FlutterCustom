import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextButtion extends StatefulWidget {
  final String content;
  final VoidCallback onClick;

  TextButtion(this.content, {this.onClick});

  @override
  State<StatefulWidget> createState() =>
      _TextButtionState(content, onClick: onClick);
}

class _TextButtionState extends State<TextButtion> {
  String content;
  VoidCallback onClick;

  _TextButtionState(this.content, {this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      child: GestureDetector(
        onTap: this.onClick,
        child: Text(this.content,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800)),
      ),
    );
  }
}
