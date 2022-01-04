import 'package:flutter/material.dart';

class MyTabBarApp extends StatelessWidget {
  const MyTabBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _tabs_size = 10;
    const _labels = [
      "car",
      "train",
      "bike",
      "Tab 1",
      "Tab 2",
      "Tab 3",
      "Tab 4",
      "Tab 5",
      "Tab 6",
      "Tab 7"
    ];
    const _tabs = [
      Tab(text: "Car", icon: Icon(Icons.directions_car)),
      Tab(text: "Train", icon: Icon(Icons.directions_train)),
      Tab(text: "Bike", icon: Icon(Icons.directions_bike)),
      Tab(text: "Tab 1"),
      Tab(text: "Tab 2"),
      Tab(text: "Tab 3"),
      Tab(text: "Tab 4"),
      Tab(text: "Tab 5"),
      Tab(text: "Tab 6"),
      Tab(text: "Tab 7"),
    ];

    return MaterialApp(
      home: Scaffold(
        body: DefaultTabController(
          length: _tabs_size,
          child: Scaffold(
            appBar: AppBar(
              title: Text("tabs by DefaultTabController"),
              bottom: TabBar(
                tabs: _tabs,
                indicatorColor: Colors.amber,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cn.bing.com/sa/simg/favicon-2x.ico'),
                    fit: BoxFit.cover,
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.purple,
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: List.generate(
                _tabs_size,
                (index) => Center(child: Text("It's ${_labels[index]} here.")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTabBarAppTwo extends StatefulWidget {
  MyTabBarAppTwo({Key? key}) : super(key: key);

  @override
  _MyTabBarAppTwoState createState() => _MyTabBarAppTwoState();
}

class _MyTabBarAppTwoState extends State<MyTabBarAppTwo>
    with SingleTickerProviderStateMixin {
  int _tabs_size = 10;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs_size, vsync: this);
    _tabController.addListener(() {
      /* event logic */
      print("state changed.");
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("tabs with SingleTickerProviderStateMixin"),
          bottom: TabBar(
            controller: _tabController,
            tabs: List.generate(
              _tabs_size,
              (index) => Tab(text: "Tab ${index}"),
            ),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: List.generate(
            _tabs_size,
            (index) => Tab(text: "It's Tab ${index} here."),
          ),
        ),
      ),
    );
  }
}
