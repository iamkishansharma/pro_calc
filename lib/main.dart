import 'package:flutter/material.dart';
import 'agecalc.dart';
import 'bmicalc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kishan",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstNum, secondNum;
  String textToDisplay = "";
  String result;
  String operationToPerform;

  void btnClicked(String btnText) {
    if (btnText == "C") {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = "";
      result = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "X" ||
        btnText == "/") {
      firstNum = int.parse(textToDisplay);
      result = "";
      operationToPerform = btnText;
    } else if (btnText == "=") {
      secondNum = int.parse(textToDisplay);
      if (operationToPerform == "+") {
        result = (firstNum + secondNum).toString();
      }
      if (operationToPerform == "-") {
        result = (firstNum - secondNum).toString();
      }
      if (operationToPerform == "X") {
        result = (firstNum * secondNum).toString();
      }
      if (operationToPerform == "/") {
        result = (firstNum / secondNum).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnText).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  Widget cusutomButtonColor(String btnVal) {
    return Expanded(
        child: Container(
      color: Colors.orange,
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () {
          btnClicked(btnVal);
        },
        child: Text(
          "$btnVal",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    ));
  }

  Widget cusutomButton(String btnVal) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () {
          btnClicked(btnVal);
        },
        child: Text(
          "$btnVal",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ProCalculator",
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(backgroundImage:  NetworkImage("https://avatars3.githubusercontent.com/u/36340195?s=400&u=64b04f014537e82e746eebc1366a76d476a87069&v=4")),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Age Calculator'),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => NewPage("Page two")));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.tag_faces),
                title: Text('BMI Calculator'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.format_line_spacing),
                title: Text('Unit Converter'),
                onTap: () {
                  Navigator.of(context).pop();
                  //////////////////////////////////////
                },
              ),
              ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Currency Exchange'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$textToDisplay",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  cusutomButton("9"),
                  cusutomButton("8"),
                  cusutomButton("7"),
                  cusutomButtonColor("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  cusutomButton("6"),
                  cusutomButton("5"),
                  cusutomButton("4"),
                  cusutomButtonColor("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  cusutomButton("3"),
                  cusutomButton("2"),
                  cusutomButton("1"),
                  cusutomButtonColor("X"),
                ],
              ),
              Row(
                children: <Widget>[
                  cusutomButton("C"),
                  cusutomButton("0"),
                  cusutomButton("="),
                  cusutomButtonColor("/"),
                ],
              ),
            ],
          ),
        ));
  }
}
