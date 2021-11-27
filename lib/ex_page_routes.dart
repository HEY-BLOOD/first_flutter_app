import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageRouteApp extends StatelessWidget {
  const MyPageRouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Next"),
          onPressed: () => {
            // Navigator.push(context, _buildPageRoute()),
            // or
            // 1. use a ios style page route
            // CupertinoPageRoute(builder: (context) => SecondPage()),
            // 2. use a Material style page route
            // MaterialPageRoute(builder: (context) => SecondPage()),
            // 3. use custom page route
            Navigator.of(context).push(_buildPageRoute()),
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("GO BACK"),
          onPressed: () {
            // Navigator.pop(context);
            // or
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

Route _buildPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => SecondPage(),
    transitionsBuilder: (c, a1, a2, child) =>
        ScaleTransition(scale: a1, child: child),
    // FadeTransition(opacity: a1, child: child),
    transitionDuration: Duration(seconds: 1),
  );
}
