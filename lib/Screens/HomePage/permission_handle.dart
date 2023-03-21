import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/HomePage/homescreen.dart';

class PermissionRequestBox extends StatefulWidget {
  const PermissionRequestBox({Key? key}) : super(key: key);

  @override
  State<PermissionRequestBox> createState() => _PermissionRequestBoxState();
}

class _PermissionRequestBoxState extends State<PermissionRequestBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: Text(
              tpermissionreq,
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              PermissionStatus physicalStatus =
                  await Permission.activityRecognition.request();

              if (physicalStatus == PermissionStatus.granted) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
              if (physicalStatus == PermissionStatus.denied) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PermissionRequestBox(),
                  ),
                );
              }
              if (physicalStatus == PermissionStatus.permanentlyDenied) {
                openAppSettings();
              }

            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: const Color.fromARGB(255, 34, 77, 59),
              elevation: 0,
              minimumSize: const Size(300, 50),
            ),
            child: Text(
              tgrantper,
              style: const TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: obcolor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
