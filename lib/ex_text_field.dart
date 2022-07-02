import 'package:flutter/material.dart';

class MyTextFieldApp extends StatelessWidget {
  const MyTextFieldApp({Key? key}) : super(key: key);

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controllerForEmail;

  FocusNode focusNodeForEmail = FocusNode();

  @override
  void initState() {
    super.initState();
    _controllerForEmail = TextEditingController(text: "username@example.com");
  }

  @override
  void dispose() {
    super.dispose();
    _controllerForEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Sample"),
      ),
      body: SingleChildScrollView(
        // reverse: true,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterLogo(size: 150),
            SizedBox(height: 20),
            TextField(
              // textInputAction: TextInputAction.continueAction,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_rounded),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: 'Name',
              ),
              onChanged: (value) {
                debugPrint("name value: ${value}");
              },
              onEditingComplete: () {
                debugPrint("onEditingComplete");
              },
              onSubmitted: (value) {
                debugPrint("onSubmitted value: ${value}");
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: "Email Address"),
              controller: _controllerForEmail,
              onChanged: (value) {
                debugPrint("email value: ${value}");
              },
              focusNode: focusNodeForEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                labelText: 'Password',
                helperText: "Keep it secrect",
              ),
              onChanged: (value) {
                debugPrint("password value: ${value}");
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Colors.red),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                labelText: 'Phone',
                hintText: "Telephone Number",
              ),
              onChanged: (value) {
                debugPrint("phone value: ${value}");
              },
              maxLength: 11,
              autofocus: false,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 2,
              decoration: InputDecoration.collapsed(
                hintText: 'Where do you live?',
                filled: true,
                fillColor: Color.fromARGB(255, 166, 243, 225),
              ),
              onChanged: (value) {
                debugPrint("address value: ${value}");
              },
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  FocusScope.of(context).requestFocus(focusNodeForEmail),
              child: Text("focus email field"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondPage(userInput: _controllerForEmail.text)));
        },
        child: Icon(Icons.skip_next),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String userInput;

  SecondPage({Key? key, required this.userInput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(child: Text(userInput)),
    );
  }
}
