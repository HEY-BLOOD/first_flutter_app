import 'package:flutter/material.dart';

class MyAppBarApp extends StatelessWidget {
  const MyAppBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar title'),
        centerTitle: true,
        elevation: 20,
        toolbarHeight: 90,
        toolbarOpacity: 0.7,
        backgroundColor: Colors.green,
        leadingWidth: 100,
        leading: Container(
          color: Colors.red,
          child: IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Clicked appbar leading')),
              );
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more),
            tooltip: 'More',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Clicked action More')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Clicked action Settings')),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Hello Flutter!"),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MySecondPage())),
              child: Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Second Page"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          child: Text("My Second Page"),
        ),
      ),
    );
  }
}
