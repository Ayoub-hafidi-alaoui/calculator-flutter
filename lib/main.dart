import 'package:calculator_flutter/calculator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "calculator",
      initialRoute: CalculatorScreen.ROUTE_NAME,
      routes: {CalculatorScreen.ROUTE_NAME: (_)=> CalculatorScreen()},

    );
  }

}