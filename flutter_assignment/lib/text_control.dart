import 'package:flutter/material.dart';

import './my_text.dart';

class TextControl extends StatelessWidget {
  final String textToBeUsed;
  final Function changeText;

  TextControl(this.textToBeUsed, this.changeText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(textToBeUsed),
        ElevatedButton(onPressed: changeText, child: Text('Change Text'))
      ],
    );
  }
}
