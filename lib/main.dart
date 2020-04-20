import 'package:flutter/material.dart';
import 'calc.dart';
import 'agecalc.dart';
import 'bmicalc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pro Calculator",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.tag_faces),
                title: Text("BMI Calculator"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                leading: Icon(Icons.format_line_spacing),
                title: Text('Unit Converter'),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => My2App()));
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
        body: Calculator(),
      );
  }
}
