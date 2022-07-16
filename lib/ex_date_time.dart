import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateTimeApp extends StatelessWidget {
  const MyDateTimeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Date and Time Demo",
      home: MyDateTimeHome(),
    );
  }
}

class MyDateTimeHome extends StatefulWidget {
  MyDateTimeHome({Key? key}) : super(key: key);

  @override
  State<MyDateTimeHome> createState() => _MyDateTimeHomeState();
}

class _MyDateTimeHomeState extends State<MyDateTimeHome> {
  var dateTime;
  var timeStamp;
  var newDateTime;
  var formatDateTime;
  var parsedDateTime;

  // for date picker
  var selectedDate;

  // for time picker
  var selectedTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    timeStamp = dateTime.millisecondsSinceEpoch;
    newDateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    formatDateTime = DateFormat("yyyy/MM/dd HH:mm:ss").format(dateTime);
    parsedDateTime = DateTime.parse('1969-07-20 20:18:04Z');

    selectedDate = DateTime.now();
    selectedTime = TimeOfDay(hour: 23, minute: 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date and Time Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("dateTime: $dateTime"),
            Text("timeStamp: $timeStamp"),
            Text("newDateTime: $newDateTime"),
            Text("formatDateTime: $formatDateTime"),
            Text("parsedDateTime: $parsedDateTime"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text("Show Date Picker"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: Text("Show Time Picker"),
                ),
              ],
            ),
            Text("selectedDate: ${DateFormat("yyyy/MM/dd").format(selectedDate)}"),
            Text("selectedTime: $selectedTime"),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
