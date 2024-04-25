import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepometer/DataBase/database.dart';
import 'package:stepometer/DataBase/db_goalcount/goal_model.dart';
import 'package:stepometer/Screens/HomePage/GetSteps/getstepcount.dart';
import 'package:stepometer/Screens/HomePage/Widgets/getgoalsheet.dart';
import 'package:stepometer/Screens/HomePage/profilescreen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Constants/colors.dart';
import '../../Constants/images.dart';
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

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int _steps = 0;
  String _DateTime = '?';

  bool _isReset = false;
  late AnimationController _playcontroller;

  bool isGetData = true;
  MyDatabase db = MyDatabase();
  List<GoalModel> localList = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _playcontroller =
        AnimationController(duration: Duration(milliseconds: 690), vsync: this);
    db.copyPasteAssetFileToRoot().then((value) {
      db.getGoalCount();
    });
  }

  @override
  void dispose() {
    _playcontroller.dispose();
    super.dispose();
  }

//#region ==> ---- Pedometer Counters
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      if (_isReset == true) {
        _steps = event.steps;
        _steps = 0;
      }
      else{
        _steps = event.steps;
      }
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    //print(event);
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
      _steps = 0;
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

//endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<GoalModel>>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (isGetData) {
                  localList.addAll(snapshot.data!);
                  //searchList.addAll(localList);
                }
                isGetData = false;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //#region ---- DayDate
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
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
                    //endregion

                    //#region ---- Percent Indicator & RESET Btn
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          child: SfRadialGauge(
                            animationDuration: 2500,
                            enableLoadingAnimation: true,
                            axes: <RadialAxis>[
                              RadialAxis(
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: _steps /
                                        double.parse(localList[0].goalCount),
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.2,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    color: mainthemecolor,
                                  )
                                ],
                                minimum: 0,
                                maximum: 1,
                                showLabels: false,
                                showTicks: false,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.2,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Color.fromARGB(30, 0, 169, 181),
                                  thicknessUnit: GaugeSizeUnit.factor,
                                ),
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    positionFactor: 0.1,
                                    angle: 90,
                                    widget: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${_steps}",
                                          style: const TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "/ ${localList[0].goalCount}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                              onPressed: () {
                                _isReset = true;
                                print(":::: RESET PRESSED ::::" +
                                    _isReset.toString());
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: mainthemecolor,
                                elevation: 0,
                                minimumSize: Size(55, 55),
                                shape: StadiumBorder(),
                              ),
                              child: Icon(Icons.restart_alt_rounded)),
                        ),
                      ],
                    ),
                    //endregion

                    //#region ---- Status Text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Status : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            _status == 'walking'
                                ? Icons.directions_walk
                                : _status == 'stopped'
                                    ? Icons.accessibility_new
                                    : Icons.error,
                            size: 30,
                          ),
                          Center(
                            child: Text(
                              _status,
                              style:
                                  _status == 'walking' || _status == 'stopped'
                                      ? const TextStyle(fontSize: 18)
                                      : const TextStyle(
                                          fontSize: 18, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //endregion

                    //#region ---- Change Goal Btn
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: mainthemecolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    topLeft: Radius.circular(30)),
                              ),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: GetGoalSheet(),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: mainthemecolor,
                          elevation: 0,
                          minimumSize: Size(200, 45),
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
                    //endregion

                    //#region ---- Other Details Cards
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.only(
                    //         top: 10,
                    //       ),
                    //       padding: EdgeInsets.only(
                    //           top: 5, bottom: 5, left: 15, right: 15),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: Colors.grey.shade300),
                    //       child: Column(
                    //         children: [
                    //           Icon(Icons.location_on_outlined),
                    //           Text("1.9km"),
                    //           Text("Distance"),
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    //       padding: EdgeInsets.only(
                    //           top: 5, bottom: 5, left: 15, right: 15),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: Colors.grey.shade300),
                    //       child: Column(
                    //         children: [
                    //           Icon(CupertinoIcons.clock),
                    //           Text("1H 2M"),
                    //           Text("Duration"),
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.only(
                    //         top: 10,
                    //       ),
                    //       padding: EdgeInsets.only(
                    //           top: 5, bottom: 5, left: 15, right: 15),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: Colors.grey.shade300),
                    //       child: Column(
                    //         children: [
                    //           Icon(CupertinoIcons.flame),
                    //           Text("169 Cal"),
                    //           Text("Calories"),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //endregion
                  ],
                );
              } else {
                return (const Center(
                  child: CircularProgressIndicator(),
                ));
              }
            },
            future: isGetData ? db.getGoalCount() : null),
      ),
    );
  }
}
