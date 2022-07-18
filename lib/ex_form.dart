import 'package:flutter/material.dart';

class MyFormApp extends StatelessWidget {
  const MyFormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  var dropdownSelected = "one";
  var dropdownList = <String>["one", "two", "three", "four"];

  var isChecked = false;

  var sex = "male";

  var isOn = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter something.";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: Text("Validate")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Switch:"),
                SizedBox(width: 10),
                Switch(
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    }),
              ],
            ),
            Container(
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: "male",
                    groupValue: sex,
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) sex = value;
                      });
                    },
                  ),
                  Text("Male"),
                  Radio(
                    value: "female",
                    groupValue: sex,
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) sex = value;
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Checkbox:"),
                SizedBox(width: 10),
                Checkbox(
                    value: isChecked,
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) isChecked = value;
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("DropdownButton:"),
                SizedBox(width: 10),
                DropdownButton(
                  value: dropdownSelected,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  items: dropdownList
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (String? value) async {
                    setState(() {
                      if (value != null) dropdownSelected = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
