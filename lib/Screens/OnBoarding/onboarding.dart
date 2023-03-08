import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stepometer/Screens/OnBoarding/onboardingcontroller.dart';
import 'package:stepometer/Screens/homescreen.dart';
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
            // fullTransitionValue: 600,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.liquidReveal,

          ),
          //endregion

          //#region Center Arrow Btn
          Positioned(
            bottom: 70.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 34, 77, 59),
                  width: 4,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(13),
              ),
              child: Container(
                padding: const EdgeInsets.all(18.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 34, 77, 59),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //endregion

          //#region Skip Btn
          Positioned(
            top: 50,
            right: 33,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 15,
                  color: Color.fromARGB(255, 34, 77, 59),
                ),
              ),
            ),
          ),
          //endregion

          //#region Page Indicator
          Obx(
            () => Positioned(
              bottom: 20,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const ScaleEffect(
                  activeStrokeWidth: 6,
                  scale: 5,
                  spacing: 20,
                  paintStyle: PaintingStyle.fill,
                  activePaintStyle: PaintingStyle.stroke,
                  activeDotColor: Color.fromARGB(255, 34, 77, 59),
                  dotColor: Color.fromARGB(255, 83, 147, 116),
                  dotHeight: 5,
                  dotWidth: 5,
                ),
              ),
            ),
          ),
          //endregion

        ],
      ),
    );
  }
}
