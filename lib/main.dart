import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding.dart';

Future<void> main() async {
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //top status bar
        systemNavigationBarColor: Colors.white,
        // navigation bar color, the one Im looking for
        statusBarIconBrightness: Brightness.dark,
        // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: maintheme,
          colorScheme: ColorScheme.fromSeed(
            seedColor: mainthemecolor,
            primary: mainthemecolor,
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
        // home: const OnBoardingScreen(),
      ),
    );
  }
}
