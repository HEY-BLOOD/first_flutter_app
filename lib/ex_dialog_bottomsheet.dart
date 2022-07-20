import 'package:flutter/material.dart';

class MyDialogBottomSheetApp extends StatelessWidget {
  const MyDialogBottomSheetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDialogBottomSheetPage(),
    );
  }
}

class MyDialogBottomSheetPage extends StatefulWidget {
  MyDialogBottomSheetPage({Key? key}) : super(key: key);

  @override
  State<MyDialogBottomSheetPage> createState() =>
      _MyDialogBottomSheetPageState();
}

class _MyDialogBottomSheetPageState extends State<MyDialogBottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog & BottomSheet Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: _showDialog, child: Text("Show Dialog")),
            ElevatedButton(
                onPressed: _showSimpleDialog, child: Text("Show SimpleDialog")),
            ElevatedButton(
                onPressed: _showCustomizedDialog,
                child: Text("Show CustomizedDialog")),
            ElevatedButton(
                onPressed: _showGeneralDialog,
                child: Text("Show GeneralDialog")),
            ElevatedButton(
                onPressed: _showModalBottomSheet,
                child: Text("Show ModalBottomSheet")),
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        color: Colors.amber,
        child: Text("Bottom Sheet"),
      ),
    );
  }

  _showGeneralDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) => Container(
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  _showCustomizedDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text("Title of SimpleDialog"),
        children: [
          SimpleDialogOption(
            child: Text("Option 1"),
            onPressed: () {
              debugPrint("Option 1 clicked");
            },
          ),
          SimpleDialogOption(
            child: Text("Option 2"),
            onPressed: () {
              debugPrint("Option 2 clicked");
            },
          ),
          SimpleDialogOption(
            child: Text("Option 3"),
            onPressed: () {
              debugPrint("Option 3 clicked");
            },
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("title of alert"),
        content: Text("content of Dialog"),
        elevation: 8,
        backgroundColor: Colors.yellowAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
