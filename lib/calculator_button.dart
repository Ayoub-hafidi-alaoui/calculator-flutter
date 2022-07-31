import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onButtonClick;

  CalculatorButton(this.text, this.onButtonClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ElevatedButton(onPressed: (){
      onButtonClick(text);
    },
      child: Text("$text", style: TextStyle(fontSize: 32),) ,));
  }

}