import 'package:flutter/material.dart';
import 'package:stepometer/Screens/SignInUp/signup.dart';
import 'dart:ui';

import '../../Constants/colors.dart';
import '../../Constants/images.dart';
import '../../Constants/texts.dart';
import '../HomePage/homescreen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            // bg and partitions
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    mainthemecolor,
                    secondarythemecolor,
                    mainthemecolor,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 12,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black.withOpacity(0.15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //text
            Container(
              margin: const EdgeInsets.only(top: 125, left: 25),
              child: const Text(
                tlogintitle,
                style: TextStyle(
                  fontFamily: 'Raleway-Bold',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),

            //Text Areas
            Container(
              margin: const EdgeInsets.only(top: 300, left: 25),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 55),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 55),
                    child: const TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),

            // Remember me
            Container(
              margin: const EdgeInsets.only(top: 440, left: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                          value: isCheck,
                          side:
                          const BorderSide(color: Colors.white, width: 1.5),
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          onChanged: (c) {
                            setState(
                                  () {
                                isCheck = !isCheck;
                              },
                            );
                          },
                        ),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          letterSpacing: 0,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // buttons
            Center(
              child: Column(
                children: [
                  Container(
                    margin:
                    const EdgeInsets.only(top: 500, bottom: 15, right: 35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(290, 50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '  Log In',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        animationDuration: const Duration(milliseconds: 1000),
                        backgroundColor: Colors.grey.shade900,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(290, 50),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ImageIcon(
                            AssetImage(googleicon),
                            size: 18,
                            color: Colors.white,
                          ),
                          Text(
                            tgoogletitle,
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // signup text
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 710, left: 35),
                  child: const Text(
                    tforgottitle,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 710),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 15,
                      ),
                    ),
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
