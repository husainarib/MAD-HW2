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

  void numberPressed(String number) {
    setState(() {
      //TODO implement method
    });
  }

  void operatorPressed(String op) {
    setState(() {
      //TODO implement method
    });
  }

  void calculate() {
    setState(() {
      //TODO implement method
    });
  }

  void clear() {
    setState(() {
      //TODO implement method
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
