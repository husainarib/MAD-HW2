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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 223, 241),
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //last input text
                    Text(
                      lastInput,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    //main display text
                    Text(
                      displayText,
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //TODO Numbers and Operators Buttons
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String buttonText) {
    Color buttonColor = Colors.blueAccent;
    if (buttonText == 'C') {
      buttonColor = Colors.redAccent;
    } else if (buttonText == '=') {
      buttonColor = Colors.green;
    }

    return GestureDetector(
      onTap: () {
        if (buttonText == 'C') {
          clear();
        } else if (buttonText == '=') {
          calculate();
        } else if ('+-*/'.contains(buttonText)) {
          operatorPressed(buttonText);
        } else {
          numberPressed(buttonText);
        }
      },
      child: Container(
        height:50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
