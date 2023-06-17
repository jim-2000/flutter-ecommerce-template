import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/widgets/auth/OtpWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/services/auth/AuthService.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = 'otpScreen';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).user;
    return Consumer<UserProvider>(
      builder: (ctx, value, child) {
        return value.isLoading
            ? Scaffold(
                backgroundColor: AppColors.AppBg,
                body: Center(
                  child: SizedBox(
                    height: 65,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballSpinFadeLoader,
                        strokeWidth: 4,
                        colors: [AppColors.AppPrimary]),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Code has been sent to your ${userProvider.email}",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        OtpPinput(
                            oncomplete: (value) => {
                                  AuthServices().submitotp(context, otp: value),
                                }),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                AuthServices().reSentOtp(userProvider.email);
                              },
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                  color: AppColors.AppPrimary,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
