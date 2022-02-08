import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstNumber;
  late int secondNumber;
  String textToDisplay = "";
  String textToDisplay11 = "";
  late String result = "0";
  late String result11 = "0";
  late String operatorToPerform;

  buttonClicked(String buttonValue) {
    if (textToDisplay.length == 0 &&
        (buttonValue == "+" ||
            buttonValue == "-" ||
            buttonValue == "x" ||
            buttonValue == "/")) {
      return;
    }

    if (buttonValue == "C") {
      textToDisplay = "";
      textToDisplay11 = "";
      firstNumber = 0;
      secondNumber = 0;
      result = "";
      result11 = "0";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/") {
      firstNumber = int.parse(textToDisplay);
      result = "";
      textToDisplay11 = textToDisplay + buttonValue;
      operatorToPerform = buttonValue;
    } else if (buttonValue == "=") {
      secondNumber = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operatorToPerform == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operatorToPerform == "x") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operatorToPerform == "/") {
        result = (firstNumber / secondNumber).toString();
      }

      result11 = result;
    } else {
      result = int.parse(textToDisplay + buttonValue).toString();

      textToDisplay11 = textToDisplay11 + buttonValue;
    }
    setState(() {
      // print();
      textToDisplay = result;
    });
  }

  Widget customButton(String buttonValue) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: TextButton(
          // padding : EdgeInsets.all(25.0),
          onPressed: () => buttonClicked(buttonValue),
          child: Text(
            "$buttonValue",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "$textToDisplay11",
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "$result11",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.pink,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
