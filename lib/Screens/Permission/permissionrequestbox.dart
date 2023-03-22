import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Constants/images.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/HomePage/homescreen.dart';
import 'package:stepometer/Screens/Permission/permissionperdenied.dart';

class PermissionRequestBox extends StatefulWidget {
  const PermissionRequestBox({Key? key}) : super(key: key);

  @override
  State<PermissionRequestBox> createState() => _PermissionRequestBoxState();
}

class _PermissionRequestBoxState extends State<PermissionRequestBox> {
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
              child: ImageIcon(AssetImage(walkgif),size: 111,),
            ),
            Container(
              margin: EdgeInsets.only(left:30,right: 30),
              child: Text(
                tpermissionreq,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),
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

                if (physicalStatus == PermissionStatus.permanentlyDenied) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PermissionPerDenied(),
                    ),
                  );
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
      ),
    );
  }
}
