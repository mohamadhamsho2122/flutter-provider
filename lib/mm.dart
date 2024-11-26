import 'package:flutter/material.dart';

class Mm extends StatefulWidget {
  const Mm({super.key});

  @override
  State<Mm> createState() => _MmState();
}

class _MmState extends State<Mm> {
  DateTime dateTime = DateTime.now();
  void _showdatapicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((Value) {
      setState(() {
        dateTime = Value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              dateTime.year.toString(),
              style: TextStyle(fontSize: 40),
            ),
            MaterialButton(
              onPressed: _showdatapicker,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'chose data',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
