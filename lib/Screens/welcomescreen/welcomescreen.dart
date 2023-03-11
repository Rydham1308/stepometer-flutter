import 'package:flutter/material.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Constants/images.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/homescreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    return Scaffold(
      body: Container(
        color: obcolor2,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(wsimag1), height: height * 0.5),
            Column(
              children: const [
                Text(
                  tWelcomeTitle,
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 280,
                  child: Text(tWelcomeSubTitle,
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 00,
                            minimumSize: const Size(250, 50),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 34, 77, 59),
                              width: 4,
                            ),
                          ),
                          child: Text(
                            tLogin.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Color.fromARGB(255, 34, 77, 59),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 34, 77, 59),
                            elevation: 0,
                            minimumSize: const Size(250, 50),
                          ),
                          child: Text(
                            tSignup.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: obcolor2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 00,
                        minimumSize: const Size(250, 50),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 34, 77, 59),
                          width: 4,
                        ),
                      ),
                      child: Text(
                        tGuest.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          color: Color.fromARGB(255, 34, 77, 59),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
