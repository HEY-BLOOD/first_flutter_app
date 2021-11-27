import 'package:first_app/ex_page_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyPageRouteApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text("Hello Flutter!"),
        ),
      ),
    );
  }
}
