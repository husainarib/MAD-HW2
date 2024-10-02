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
  
  //method to show which number was pressed
  void numberPressed(String number) {
    setState(() {
      if (displayText == '0') {
        displayText = number;
      } else {
        displayText += number;
      }
    });
  }

  //method to show which operator was pressed
  void operatorPressed(String op) {
    setState(() {
      firstOperand = double.parse(displayText);
      operator = op;
      displayText = '';
    });
  }

  //method to calculate
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
            result = 'ERROR!';
          }
          break;
      }
      displayText = result;
    });
  }

  void clear() {
    setState(() {
      displayText = '0';
      firstOperand = 0;
      secondOperand = 0;
      operator = '';
      result = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //TODO implement children
        ],
      ),
    );
  }

  Widget numberButton(String number) {
    //TODO implement method
  }

  Widget operatorButton(String op) {
    //TODO implement method
  }

  Widget deleteButton() {
    //TODO implement method
  }

  Widget equalButton() {
    //TODO implement method
  }
}
