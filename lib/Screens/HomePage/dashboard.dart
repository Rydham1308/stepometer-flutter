import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepometer/Screens/HomePage/GetSteps/getstepcount.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Constants/colors.dart';
import '../../Constants/texts.dart';
import '../SignInUp/signup.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

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
    double steps = double.parse(_steps);
    int goalSteps = 7000;

    double percent = steps / goalSteps;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Jiffy.now().format(pattern: 'EEEE'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ',',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    Jiffy.now().format(pattern: 'MMM do'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                radius: 100,
                lineWidth: 25,
                percent: percent,
                progressColor: mainthemecolor,
                backgroundColor: Colors.black12,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  _steps,
                  // todaySteps?.toString()??'0',
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pedestrian status :',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    _status == 'walking'
                        ? Icons.directions_walk
                        : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                    size: 20,
                  ),
                  Center(
                    child: Text(
                      _status,
                      style: _status == 'walking' || _status == 'stopped'
                          ? const TextStyle(fontSize: 15)
                          : const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                child: Text(
                  "GOAL : $goalSteps Steps",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            Container(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(

                  shadowColor: Colors.transparent,
                  backgroundColor: mainthemecolor,
                  elevation: 0,
                  minimumSize: const Size(200, 45),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Change Goal",
                  style: const TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Column(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("1.9km"),
                      Text("Distance"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.clock),
                      Text("1H 2M"),
                      Text("Duration"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.flame),
                      Text("169 Cal"),
                      Text("Calories"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
