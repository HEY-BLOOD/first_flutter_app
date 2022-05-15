import 'package:flutter/material.dart';

class MyButtonApp extends StatelessWidget {
  const MyButtonApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Button Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(fontSize: 20);
    final ButtonStyle _buttonStyle =
        ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 18));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ElevatedButton", style: _textStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: _buttonStyle,
                onPressed: null,
                child: const Text('Disabled'),
              ),
              ElevatedButton(
                style: _buttonStyle,
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.settings),
                label: Text("Settings"),
              )
            ],
          ),
          SizedBox(height: 20),
          Text("TextButton", style: _textStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: _buttonStyle,
                onPressed: null,
                child: const Text('Disabled'),
              ),
              TextButton(
                style: _buttonStyle,
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(primary: Colors.yellow),
                      onPressed: () {},
                      child: const Text('Gradient'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("OutlinedButton", style: _textStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  debugPrint('Received click');
                },
                child: const Text('Click Me'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.orange, backgroundColor: Colors.teal),
                onPressed: () {},
                child: Text("custom"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
