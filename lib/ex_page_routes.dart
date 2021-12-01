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
      // FIXME only initialRoute or home
      initialRoute: '/home',
      // home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/fourth': (context) => FourthPage(),
      },
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Next"),
          onPressed: () => Navigator.pushNamed(context, '/first'),
        ),
      ),
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Back"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
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
                    arguments: "args of second page"),
              },
            ),
          ],
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("Go to third page"),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            ElevatedButton(
              child: Text("Replace with third page"),
              onPressed: () {
                // go to last page
                /* Navigator.pop(context);
                // or
                Navigator.of(context).pop(); */

                Navigator.pushReplacementNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("Back to last"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text("Go to fourth page"),
              onPressed: () {
                // Clear route stack, and back route will be ModalRoute.withName()
                Navigator.pushNamedAndRemoveUntil(
                    context, '/fourth', ModalRoute.withName('/first'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Back to first"),
          onPressed: () {
            // it will back to initialRoute, because the route stack is empty
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
