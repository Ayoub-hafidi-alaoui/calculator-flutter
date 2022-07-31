import 'package:calculator_flutter/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String ROUTE_NAME = "calculator";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Text(
            "$resultText",
            style: const TextStyle(fontSize: 32),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("7", onDigitClick),
                CalculatorButton("8", onDigitClick),
                CalculatorButton("9", onDigitClick),
                CalculatorButton("/", onOperatorClick),
              ],
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton("4", onDigitClick),
              CalculatorButton("5", onDigitClick),
              CalculatorButton("6", onDigitClick),
              CalculatorButton("*", onOperatorClick),
            ],
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton("1", onDigitClick),
                CalculatorButton("2", onDigitClick),
                CalculatorButton("3", onDigitClick),
                CalculatorButton("+", onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(".", onDigitClick),
                CalculatorButton("0", onDigitClick),
                CalculatorButton("=", OnEqualClick),
                CalculatorButton("-", onOperatorClick),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDigitClick(String btnText) {
    print(btnText);
    resultText += btnText;
    setState(() {});
  }

  String number = '';
  String operator = '';

  void onOperatorClick(String op) {
    if (number.isEmpty) {
      number = resultText;
    } else {
      number = calculate(number, operator, resultText);
    }
    operator = op;
    resultText = '';
    setState(() {});
  }

  void OnEqualClick(String _) {
    String res = calculate(number, operator, resultText);
    resultText = res;
    number = '';
    operator = '';
    setState(() {
    });

  }

  String calculate(String n1, String op, String n2) {
    double result = 0;
    double number1 = double.parse(n1);
    double number2 = double.parse(n2);
    if (op == "+") {
      result = number1 + number2;
    } else if (op == "-") {
      result = number1 - number2;
    } else if (op == "*") {
      result = number1 * number2;
    } else if (op == "/") {
      result = number1 / number2;
    }
    return result.toString();
  }
}
