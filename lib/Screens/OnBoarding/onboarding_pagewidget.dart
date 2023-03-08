import 'package:flutter/material.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding_model.dart';

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
              fontFamily: "Raleway",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
