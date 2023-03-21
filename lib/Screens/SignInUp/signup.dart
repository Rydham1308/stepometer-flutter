import 'package:flutter/material.dart';
import 'package:stepometer/Constants/texts.dart';
import 'dart:ui';

import '../../Constants/colors.dart';
import '../../Constants/images.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
                'Create \nyour account',
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
              margin: const EdgeInsets.only(top: 250, left: 25),
              child: Column(
                children: [
                  //email
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
                  // name
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 55),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'name',
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
                  // password
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
              margin: const EdgeInsets.only(top: 490, left: 25, right: 75),
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
                        'By continuing, I agree to the \nTerms of Use & Privacy Policy.',
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
                        const EdgeInsets.only(top: 560, bottom: 15, right: 35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(290, 50),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '  Sign Up',
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

            // Log in text
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 710, left: 35),
                  child: const Text(
                    'Already have account ?',
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
                          builder: (context) => const LogIn(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log In',
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
