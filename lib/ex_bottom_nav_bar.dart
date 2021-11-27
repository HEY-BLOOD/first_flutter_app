import 'package:flutter/material.dart';

/// BottomNavigationBar Widget Demo
class MyBottomNavBarApp extends StatefulWidget {
  const MyBottomNavBarApp({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarAppState createState() => _MyBottomNavBarAppState();
}

class _MyBottomNavBarAppState extends State<MyBottomNavBarApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("keep widget's state using IndexedStack"),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid mail id as abc@gmail.com',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter your secure password',
          ),
        ),
      ],
    ),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: IndexedStack(
              index: _selectedIndex,
              children: _widgetOptions,
              alignment: AlignmentDirectional.center,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          backgroundColor: Colors.red, // it not work when type is shifting
          type: BottomNavigationBarType.shifting, // default fixed
          mouseCursor: SystemMouseCursors.basic,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
      ),
    );
  }
}
