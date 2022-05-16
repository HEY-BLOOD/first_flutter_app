import 'package:flutter/material.dart';

class MyFloatingActionButtonApp extends StatelessWidget {
  const MyFloatingActionButtonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () {},
        label: Text("New"),
      ),

      // floatingActionButton: Container(
      //   width: 100,
      //   height: 100,
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () {},
      //     backgroundColor: Colors.amber,
      //     foregroundColor: Colors.green,
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //   ),
      // ),

      appBar: AppBar(
        title: Text("FloatingActionButton Sample"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
      body: Container(
        child: Center(child: Text("FloatingActionButton Sample")),
      ),
    );
  }
}
