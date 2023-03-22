import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Constants/images.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/HomePage/homescreen.dart';

class PermissionPerDenied extends StatefulWidget {
  const PermissionPerDenied({Key? key}) : super(key: key);

  @override
  State<PermissionPerDenied> createState() => _PermissionPerDeniedState();
}

class _PermissionPerDeniedState extends State<PermissionPerDenied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        color: mainthemecolor,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: ImageIcon(
                AssetImage(walkgif),
                size: 111,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                tperque,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                tpermissiondenined,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                tperstep1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                tperstep2,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                tperstep3,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {

                PermissionStatus physicalStatus =
                await Permission.activityRecognition.status;
                if (physicalStatus == PermissionStatus.granted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
                else{
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
                tgotoset,
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
      ),
    );
  }
}
