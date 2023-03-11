import 'package:flutter/material.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding_model.dart';

import '../welcomescreen/welcomescreen.dart';

class OnBoardingPageWidget  extends StatelessWidget {

  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.35,
          ),
          Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w900,
                  fontSize: 48,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  model.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Text(
            model.counterText,
            style: TextStyle(
              //fontFamily: "Raleway",
              fontWeight: FontWeight.w100,
              fontSize: 15,
            ),
          ),
          //#region Skip Btn
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 20,
                color: Color.fromARGB(255, 34, 77, 59),
              ),
            ),
          ),
          //endregion
        ],
      ),
    );
  }
}
