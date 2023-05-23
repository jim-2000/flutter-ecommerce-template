import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

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
        title: "Easy-Shop \n Bye one get One",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image:
            "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        height: height,
        context: context,
      ),
      getPageData(
        title: "Find your Best Product &  Save your money",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image:
            "https://images.unsplash.com/photo-1579621970795-87facc2f976d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        height: height,
        context: context,
      ),
      getPageData(
        title: "Let's start your journey with us",
        body:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        image:
            "https://images.unsplash.com/photo-1605086998852-18371cfd9b2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80",
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
          color: AppColors.AppSecondary,
          activeColor: AppColors.AppPrimary,
          activeSize: const Size(33.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        globalBackgroundColor: AppColors.AppBg,
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
      height: double.maxFinite,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    ),
    decoration: PageDecoration(
      bodyPadding: const EdgeInsets.all(16),
      titlePadding: const EdgeInsets.all(8),
      pageColor: AppColors.AppBg,
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
    ),
  );
}
