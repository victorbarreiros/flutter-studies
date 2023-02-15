// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import './text_control.dart';

void main() => runApp(FlutterAssignment());

class FlutterAssignment extends StatefulWidget {
  @override
  State<FlutterAssignment> createState() => _FlutterAssignmentState();
}

class _FlutterAssignmentState extends State<FlutterAssignment> {
  final _texts = const [
    'Lorem',
    'ipsum',
    'dolor',
    'sit',
    'amet',
    'consectetur',
    'adipiscing',
    'elit',
    'sed',
    'do',
    'eiusmod',
    'tempor',
    'incididunt',
    'ut',
    'labore',
    'et',
    'dolore',
    'magna',
    'aliqua'
  ];

  var _textIndex = 0;

  void changeText() {
    setState(() {
      _textIndex >= 18 ? _textIndex = 0 : _textIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Assignment 1')),
        body: TextControl(_texts[_textIndex], changeText),
      ),
    );
  }
}
