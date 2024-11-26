import 'package:flutter/material.dart';

class DataTime extends StatefulWidget {
  const DataTime({super.key});

  @override
  State<DataTime> createState() => _MmState();
}

class _MmState extends State<DataTime> {
  DateTime dateTime = DateTime.now();
  TimeOfDay? timeOfDay;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateTime = value;
        });
      }
    });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          timeOfDay = value;
        });
      }
    });
  }

  void _showDateTimePicker() {
    _showDatePicker();
    _showTimePicker();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = timeOfDay != null
        ? '${timeOfDay!.hour.toString().padLeft(2, '0')}:${timeOfDay!.minute.toString().padLeft(2, '0')}'
        : 'No time selected';

    String formattedDateTime =
        '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} $formattedTime';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Time: $formattedTime',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'DateTime: $formattedDateTime',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: TextButton(
              onPressed: _showTimePicker,
              child: Text(
                'Choose Time',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: TextButton(
              onPressed: _showDatePicker,
              child: Text(
                'Choose Date',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
