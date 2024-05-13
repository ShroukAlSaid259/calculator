import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/calculator_btn.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = "calculator";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  "$resultText",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButon("7", onBtnClicked),
                CalcButon("8", onBtnClicked),
                CalcButon("9", onBtnClicked),
                CalcButon("/", onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButon("4", onBtnClicked),
                CalcButon("5", onBtnClicked),
                CalcButon("6", onBtnClicked),
                CalcButon("*", onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButon("1", onBtnClicked),
                CalcButon("2", onBtnClicked),
                CalcButon("3", onBtnClicked),
                CalcButon("+", onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButon("0", onBtnClicked),
                CalcButon(".", onBtnClicked),
                CalcButon("=", onEqual),
                CalcButon("-", onOperatorClicked),
              ],
            ),
          )
        ],
      ),
    );
  }

  String calculator(String RHS, String op, String LHS) {
    int res = 0;
    int rhs = int.parse(RHS);
    int lhs = int.parse(LHS);
    if (op == "+") {
      res = rhs + lhs;
    } else if (op == "-") {
      res = rhs - lhs;
    } else if (op == "*") {
      res = rhs * lhs;
    } else if (op == '/') {
      res = rhs ~/ lhs;
    }
    return res.toString();
  }

  void onEqual(text) {
    String LHS = resultText;
    res = calculator(res, operator, LHS);
    operator = text;

    resultText = res;
    setState(() {});
  }

  String res = "";
  String operator = "";

  void onOperatorClicked(op) {
    if (operator.isEmpty) {
      res = resultText;
    } else {
      String LHS = resultText;
      res = calculator(res, operator, LHS);
    }
    resultText = '';
    operator = op;
    setState(() {});
  }

  void onBtnClicked(text) {
    if (operator == "=") {
      resultText = '';
      resultText = text;
      operator='';
    }else{
      resultText += text;
    }

    print(resultText);
    setState(() {});
  }
}
