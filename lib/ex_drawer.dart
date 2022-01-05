import 'package:flutter/material.dart';

class MyDrawerApp extends StatelessWidget {
  const MyDrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _DrawerPage(),
    );
  }
}

class _DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              child: Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                child: Text("This is Drawer Header"),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.purple),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightGreen,
              ),
              accountName: Text("Blood"),
              accountEmail: Text("hwangblood@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              title: Text("Close drawer"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(title: Text("Item 1")),
            ListTile(title: Text("Item 2")),
            ListTile(title: Text("Item 3")),
            ListTile(title: Text("Item 4")),
            ListTile(title: Text("Item 5")),
            ListTile(title: Text("Item 6")),
            ListTile(title: Text("Item 7")),
            ListTile(title: Text("Item 8")),
            ListTile(title: Text("Item 9")),
          ],
        ),
      )),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(),
              accountName: Text("Blood"),
              accountEmail: Text("hwangblood@gmail.com"),
            ),
            ListTile(
              title: Text("Close drawer"),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Drawer"),
            ),
            ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: Text("open drawer"),
            ),
            ElevatedButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              child: Text("open end drawer"),
            )
          ],
        );
      }),
    );
  }
}
