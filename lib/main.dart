import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0';
  String _operand = '';
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      _operand = '';
      _num1 = 0.0;
      _num2 = 0.0;
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (!_output.contains('.')) {
        _output += buttonText;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      switch (_operand) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '×':
          _output = (_num1 * _num2).toString();
          break;
        case '÷':
          _output = (_num1 / _num2).toString();
          break;
      }
      _operand = '';
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('÷'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('×'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('CLEAR'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

