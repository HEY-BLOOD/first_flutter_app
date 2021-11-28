import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageRouteApp extends StatelessWidget {
  const MyPageRouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // the first way to navigate page and pass arguments
      /* onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          final arg = settings.arguments;
          return _buildPageRoute(arg);
        }
      }, */
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
      home: FirstPage(),
    );
  }
}

Route _buildPageRoute(Object? arg) {
  return PageRouteBuilder(
    // pass variable arg to SecondPage as title
    pageBuilder: (c, a1, a2) => SecondPage(title: arg),
    transitionsBuilder: (c, a1, a2, child) =>
        ScaleTransition(scale: a1, child: child),
    // FadeTransition(opacity: a1, child: child),
    transitionDuration: Duration(seconds: 1),
  );
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
            // Navigator.of(context).push(_buildPageRoute()),

            // use named page route
            Navigator.pushNamed(context, '/second',
                //  pass arguments to second page
                arguments: "args of page"),
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final title;

  const SecondPage({Key? key, this.title = 'Second Page'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg as String),
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
