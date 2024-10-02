import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';
  String result = '0';
  String operator = '';
  double firstOperand = 0;
  double secondOperand = 0;
  String lastInput = '';

  void numberPressed(String number) {
    setState(() {
      if (displayText == '0') {
        displayText = number;
      } else {
        displayText += number;
      }
    });
  }

  void operatorPressed(String op) {
    setState(() {
      lastInput = displayText;
      firstOperand = double.parse(displayText);
      operator = op;
      displayText = '';
    });
  }

  void calculate() {
    setState(() {
      secondOperand = double.parse(displayText);
      switch (operator) {
        case '+':
          result = (firstOperand + secondOperand).toString();
          break;
        case '-':
          result = (firstOperand - secondOperand).toString();
          break;
        case '*':
          result = (firstOperand * secondOperand).toString();
          break;
        case '/':
          if (secondOperand != 0) {
            result = (firstOperand / secondOperand).toString();
          } else {
            result = 'Error';
          }
          break;
      }
      displayText = result;
      lastInput = '$firstOperand $operator $secondOperand';
    });
  }

  void clear() {
    setState(() {
      displayText = '0';
      firstOperand = 0;
      secondOperand = 0;
      operator = '';
      result = '0';
      lastInput = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    //TO implement
  }