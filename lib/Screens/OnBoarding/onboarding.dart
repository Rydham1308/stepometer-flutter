import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Screens/OnBoarding/onboardingcontroller.dart';
import 'package:stepometer/Screens/welcomescreen/welcomescreen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final obController = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //#region LiquidSwipe Pages
          LiquidSwipe(
            pages: obController.pages,
            enableSideReveal: true,
            enableLoop: false,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            //fullTransitionValue: 600,
            slideIconWidget: obController.controller == WelcomeScreen() ? null : ImageIcon(size: 40,AssetImage("assets/images/walk.gif")),
            waveType: WaveType.liquidReveal,
            positionSlideIcon: 0.47,

          ),
          //endregion
        ],
      ),
    );
  }
}
