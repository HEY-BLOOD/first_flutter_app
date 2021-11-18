import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            // margin: EdgeInsets.only(left: 50, right: 10),
            // margin: EdgeInsets.symmetric(vertical: 240, horizontal: 50),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            // transform: Matrix4.translationValues(100, -100, 0),
            height: 350,
            width: 350,
            // Cannot provide both a color and a decoration To provide both, use "decoration: BoxDecoration(color: color)".
            // color: Colors.blue[400],
            decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Text(
              "This is Container Widget\n"
              "margin is all 30\n"
              "padding is all 20\n"
              "height and width are 350\n"
              "green and 2 width border, 20 circular radius\n",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Colors.lightBlue,
                decorationStyle: TextDecorationStyle.double,
                letterSpacing: 4,
                wordSpacing: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
