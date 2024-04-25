import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class PedometerScreen extends StatefulWidget {
  @override
  _PedometerScreenState createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  int _stepCount = 0;
  late DateTime _lastResetDate;

  @override
  void initState() {
    super.initState();
    startListening();
    _lastResetDate = DateTime.now();
  }

  void startListening() {
    Pedometer.stepCountStream.listen((event) {
      setState(() {
        checkResetStepCount();
        _stepCount = event.steps;
      });
    });
  }

  void checkResetStepCount() {
    DateTime currentDate = DateTime.now();
    if (currentDate.day != _lastResetDate.day) {
      resetStepCount();
      _lastResetDate = currentDate;
    }
  }

  void resetStepCount() {
    setState(() {
      _stepCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedometer'),
      ),
      body: Center(
        child: Text(
          '$_stepCount steps',
          style: TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetStepCount,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
