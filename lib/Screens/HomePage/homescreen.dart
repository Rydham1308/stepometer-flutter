import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/HomePage/dashboard.dart';
import 'package:stepometer/Screens/HomePage/profilescreen.dart';
import 'package:stepometer/Screens/Permission/permissionrequestbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Constants/colors.dart';
import 'GetSteps/getstepcount.dart';
import 'historypage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //#region ---- APP BAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainthemecolor,
        elevation: 0,
        title: const Text(
          'StepoMeter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        actions: _selectedIndex == 2 ? [
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
        ]: null
      ),
      //endregion

      //#region ---- BODY PART
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      //endregion

      //#region ---- BOTTOM NAV BAR
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.05),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              haptic: true,
              rippleColor: mainthemecolor,
              hoverColor: mainthemecolor,
              gap: 8,
              activeColor:mainthemecolor,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 300),
              tabBackgroundColor: Colors.grey.shade100,
              color: mainthemecolor,
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.personWalking,
                  text: tmainscreen,
                ),
                GButton(
                  icon: FontAwesomeIcons.chartSimple,
                  text: tsecondcreen,
                ),
                GButton(
                  icon: FontAwesomeIcons.solidUser,
                  text:tthirdscreen,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
      //endregion

    );
  }


}