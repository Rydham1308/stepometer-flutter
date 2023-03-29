
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:stepometer/Constants/colors.dart';
import 'package:stepometer/Constants/images.dart';
import 'package:stepometer/Constants/texts.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding_pagewidget.dart';
import 'package:stepometer/Screens/OnBoarding/onboarding_model.dart';
import 'package:stepometer/Screens/welcomescreen/welcomescreen.dart';

class OnBoardingController extends GetxController{

  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: obimag1,
        title: obtitle1,
        text: obtext1,
        counterText: counterText1,
        bgColor: obcolor1,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: obimag2,
        title: obtitle2,
        text: obtext2,
        counterText: counterText2,
        bgColor: obcolor2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: obimag3,
        title: obtitle3,
        text: obtext3,
        counterText: counterText3,
        bgColor: obcolor3,
      ),
    ),
    WelcomeScreen(),
  ];
  // animateToNextSlide() {
  //   int nextPage = controller.currentPage + 1;
  //   controller.animateToPage(page: nextPage);
  // }

  onPageChangedCallback(int activePageIndex) => currentPage.value = activePageIndex;

}

