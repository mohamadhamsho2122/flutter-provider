import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _scaleValue = 1;
  RangeValues _rotationValues = RangeValues(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "slider: ${_scaleValue.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: _scaleValue,
            min: 0.5,
            max: 2.0,
            divisions: 30,
            activeColor: Colors.blue,
            thumbColor: Colors.red,
            label: _scaleValue.toStringAsFixed(2),
            onChanged: (value) {
              setState(() {
                _scaleValue = value;
              });
            },
          ),
          Text(
            "range slider: Start ${_rotationValues.start.toStringAsFixed(2)}, End ${_rotationValues.end.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 20),
          ),
          RangeSlider(
            values: _rotationValues,
            min: -3.14,
            max: 3.14,
            divisions: 50,
            labels: RangeLabels(
              _rotationValues.start.toStringAsFixed(2),
              _rotationValues.end.toStringAsFixed(2),
            ),
            onChanged: (values) {
              setState(() {
                _rotationValues = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
