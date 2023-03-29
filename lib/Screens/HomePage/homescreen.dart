import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/Permission/permissionrequestbox.dart';

import '../../Constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<int> _subscription;
  late Pedometer _pedometer;
  Box<int> stepsBox = Hive.box('steps');
  late int todaySteps = 0;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  final int goalSteps = 6000;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainthemecolor,
        elevation: 0,
        title: const Text(
          'StepoMeter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 5),
              child: const Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Jiffy.now().format(pattern: 'EEEE'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
                  Text(',',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
                  Text(Jiffy.now().format(pattern: 'MMM do yy'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)),
                ],
              ),
            ),

            //#region ----old screen
            // const Text(
            //   'Steps taken:',
            //   style: TextStyle(fontSize: 30),
            // ),
            // Text(
            //   _steps,
            //   // todaySteps?.toString()??'0',
            //   style: const TextStyle(fontSize: 60),
            // ),
            // const Divider(
            //   height: 100,
            //   thickness: 0,
            //   color: Colors.white,
            // ),
            // const Text(
            //   'Pedestrian status:',
            //   style: TextStyle(fontSize: 30),
            // ),
            // Icon(
            //   _status == 'walking'
            //       ? Icons.directions_walk
            //       : _status == 'stopped'
            //           ? Icons.accessibility_new
            //           : Icons.error,
            //   size: 100,
            // ),
            // Center(
            //   child: Text(
            //     _status,
            //     style: _status == 'walking' || _status == 'stopped'
            //         ? const TextStyle(fontSize: 30)
            //         : const TextStyle(fontSize: 20, color: Colors.red),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            //endregion
          ],
        ),
      ),
    );
  }

  void startListening() {
    _pedometer = Pedometer();
    _subscription = Pedometer.pedestrianStatusStream.listen(
      getTodaySteps as void Function(PedestrianStatus event)?,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    ) as StreamSubscription<int>;
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int> getTodaySteps(int value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int? savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    int todayDayNo = Jiffy.now().dayOfYear;
    if (value < savedStepsCount!) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int? lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved! < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount!;
      print(todaySteps.toString());
    });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
}
