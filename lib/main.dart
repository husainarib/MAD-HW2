import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

// Main Application class that initialize the calculator widget
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
  // Variables for calculator state
  String displayText = '0';
  String result = '0';
  String operator = '';
  double firstOp = 0;
  double secondOp = 0;
  String lastInput = '';

  // method to capture number presses
  void numberPressed(String number) {
    setState(() {
      if (displayText == '0') {
        displayText = number;
      } else {
        displayText += number;
      }
    });
  }

  // method to capture operator presses
  void operatorPressed(String op) {
    setState(() {
      lastInput = displayText;
      firstOp = double.parse(displayText);
      operator = op;
      displayText = '';
    });
  }

  // method to calculate
  void calculate() {
    setState(() {
      secondOp = double.parse(displayText);
      switch (operator) {
        case '+':
          result = (firstOp + secondOp).toString();
          break;
        case '-':
          result = (firstOp - secondOp).toString();
          break;
        case '*':
          result = (firstOp * secondOp).toString();
          break;
        case '/':
          if (secondOp != 0) {
            result = (firstOp / secondOp).toString();
          } else {
            result = 'ERROR';
          }
          break;
      }
      displayText = result;
      lastInput = '$firstOp $operator $secondOp';
    });
  }

  // method to reset all variable values
  void clear() {
    setState(() {
      displayText = '0';
      firstOp = 0;
      secondOp = 0;
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
              // Display screen for calculator
              Container(
                alignment: Alignment.centerRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //last input
                    Text(
                      lastInput,
                      style: const TextStyle(
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
              const SizedBox(height: 10),
              // Main display for number pad and operators
              Column(
                children: [
                  buildButtonRow(['7', '8', '9', '/']),
                  buildButtonRow(['4', '5', '6', '*']),
                  buildButtonRow(['1', '2', '3', '-']),
                  buildButtonRow(['0', 'C', '=', '+']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //calculator number pad widget
  Widget buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((butonInput) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: buildButton(butonInput),
          ),
        );
      }).toList(),
    );
  }

  // button widget
  Widget buildButton(String butonInput) {
    Color buttonColor = const Color.fromARGB(255, 59, 137, 61);
    if (butonInput == 'C') {
      buttonColor = Colors.redAccent;
    } else if (butonInput == '=') {
      buttonColor = Colors.blueAccent;
    }

    // method for registering user taps
    return InkWell(
      onTap: () {
        if (butonInput == 'C') {
          clear();
        } else if (butonInput == '=') {
          calculate();
        } else if ('+-*/'.contains(butonInput)) {
          operatorPressed(butonInput);
        } else {
          numberPressed(butonInput);
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            butonInput,
            style: const TextStyle(
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
