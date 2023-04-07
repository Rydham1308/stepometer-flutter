import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('stepBox');

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
      // home: const OnBoardingScreen(),
    );
  }
}
