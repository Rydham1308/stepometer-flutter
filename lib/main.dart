import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding.dart';
import 'package:stepometer/Screens/welcomescreen/welcomescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: maintheme,
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
