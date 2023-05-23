import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:app/services/auth/AuthService.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/utils/appColors.dart';

class OtpPinput extends StatefulWidget {
  Function oncomplete;
  OtpPinput({super.key, required this.oncomplete});

  @override
  State<OtpPinput> createState() => _OtpPinputState();
}

class _OtpPinputState extends State<OtpPinput> {
  final focusNode = FocusNode();
  final pinController = TextEditingController();
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authservice = AuthServices();
    final theme = Provider.of<ThemeProvider>(context);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: theme.isDark ? AppColors.AppGrey:AppColors.AppBlack,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.AppGrey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.AppPrimary),
      borderRadius: BorderRadius.circular(8),
      color: AppColors.AppPrimary.withOpacity(0.08),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.transparent,
      ),
    );

    //
    return Pinput(
      length: 6,
      autofocus: true,
      focusNode: focusNode,
      // decoration
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      onCompleted: (value) => {
        focusNode.unfocus(),
        widget.oncomplete(value),
      },
    );
  }
}
