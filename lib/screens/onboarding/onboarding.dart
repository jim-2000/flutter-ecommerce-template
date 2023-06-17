import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

//
class OnBoarding extends StatelessWidget {
  static const String routeName = "on_boarding";
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Provider.of<ThemeProvider>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    final _pages = <PageViewModel>[
      getPageData(
        title: "Free Delivery\n Bye one get One",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image: "assets/lottie/delivery.json",
        height: height,
        context: context,
      ),
      getPageData(
        title: "Find your Best Product &  Save your money",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image: "assets/lottie/shopping.json",
        height: height,
        context: context,
      ),
      getPageData(
        title: "Let's start your journey with us",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image: "assets/lottie/delivery_truck.json",
        height: height,
        context: context,
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        pages: _pages,
        showDoneButton: true,
        showSkipButton: false,
        showNextButton: true,
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: AppColors.AppPrimary,
          activeColor: AppColors.AppIconHover,
          activeSize: const Size(33.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        globalBackgroundColor: AppColors.AppSecondary,
        done: Text(
          "Done".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        skip: Text("Skip",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: theme.isDark ? AppColors.AppBg : AppColors.Dark,
            )),
        next: Text("Next",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: theme.isDark ? AppColors.AppBg : AppColors.Dark,
            )),
        onDone: () async {
          // complete onboarding
          await storeBoolToSF("isOnBoardingComplete", true);
          pushNamedToReplace(routeName: LoginScreen.routeName);
        },
      ),
    );
  }
}

PageViewModel getPageData({
  required String title,
  required String body,
  required String image,
  required double height,
  required BuildContext context,
}) {
  final theme = Provider.of<ThemeProvider>(context);

  return PageViewModel(
    title: title,
    body: body,
    image: Container(
      height: height,
      color: AppColors.AppIconHover,
      child: Lottie.asset(
        image,
        fit: BoxFit.contain,
      ),
    ),
    decoration: PageDecoration(
      bodyPadding: const EdgeInsets.all(16),
      titlePadding: const EdgeInsets.all(8),
      pageColor: AppColors.AppSecondary,
      titleTextStyle: theme.isDark
          ? const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            )
          : const TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
      bodyTextStyle: theme.isDark
          ? const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            )
          : const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
      imageFlex: 3,
      bodyFlex: 2,
      fullScreen: false,
    ),
  );
}
