import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String changeText;

  MyText(this.changeText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        changeText,
        style: TextStyle(fontSize: 36),
        textAlign: TextAlign.center,
      ),
    );
  }
}
