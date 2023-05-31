import 'dart:convert';
import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/auth/userModel.dart';
import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/screens/auth/loginScreen.dart';
import 'package:app/screens/auth/resetPassword.dart';
import 'package:app/screens/auth/signupScreen.dart';
import 'package:app/screens/bottom_bar_Screen.dart';
import 'package:app/services/app/catagoriService.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/navigation_utils.dart';
import 'package:app/utils/sf_utils.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:app/screens/auth/otpScreen.dart';
//

class AuthServices {
  // Token verifying
  void tokenVerify(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final token = await fetchStringValuesSF('authToken');
      Map<String, String> headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      http.Response res =
          await reqGetAPIMethod(Url.verifyTokenUrl, apiHeaders: headers);
      if (res.statusCode == 200) {
        // set user provider
        final userdata = User.fromJson(jsonDecode(res.body));
        userProvider.setUserFromModel(userdata);
        userProvider.stopLoader();
        pushNamedToReplace(routeName: BottomBarScreen.routeName);
      } else if (res.statusCode == 404) {
        showSimpleNotification(
          msg: '',
          title: 'User not found',
          color: Colors.red,
        );
        storeStringToSF('authToken', '');
        pushNamedToAndRemoveUntil(routeName: SignUpScreen.routeName);
      } else {
        showSimpleNotification(
          msg: '',
          title: 'Login session Expired',
          color: Colors.red,
        );
        pushNamedToAndRemoveUntil(routeName: LoginScreen.routeName);
      }
      userProvider.stopLoader();
    } catch (e) {
      showSimpleNotification(msg: "Something went wrong", title: "Login again");
      // get login route
      pushNamedToAndRemoveUntil(routeName: LoginScreen.routeName);
    }
  }

  // login user
  void loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userProvider.startLoader();
      Map<String, dynamic> user = {
        "email": email.trim(),
        "password": password.trim(),
      };

      http.Response res = await reqPostAPIMethod(Url.logUrl, {}, user);
      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        // show success message
        showSimpleNotification(msg: data['meassage'], title: "WellCome");
        // save user token
        storeStringToSF('authToken', data['token']);
        // set user provider
        final userdata = User.fromJson(data['user']);
        userProvider.setUserFromModel(userdata);
        // replace user to verify page
        pushNamedToAndRemoveUntil(routeName: BottomBarScreen.routeName);
        userProvider.stopLoader();
      } else if (res.statusCode == 401) {
        showSimpleNotification(
          msg: "forget your password ?",
          title: "Password is incorrect",
          color: AppColors.AppPrimary,
        );
        userProvider.stopLoader();
      } else if (res.statusCode == 404) {
        showSimpleNotification(
          msg: "create new account",
          title: "User Not Found",
          color: AppColors.AppPrimary,
        );
        userProvider.stopLoader();
      } else if (res.statusCode == 422) {
        showSimpleNotification(
          msg: "Talk to customer care",
          title: "You are Blocked",
          color: AppColors.AppPrimary,
        );
        userProvider.stopLoader();
      }
      userProvider.stopLoader();
    } catch (e) {
      showSimpleNotification(msg: "Something went wrong", title: "Error");
      userProvider.stopLoader();
    }
  }

// singup user ---------------
  void signUpUser(
    BuildContext context,
    String username,
    String email,
    String password,
    String phone,
  ) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.startLoader();
    try {
      Map<String, dynamic> user = {
        "username": username.trim(),
        "email": email.trim(),
        "password": password.trim(),
        "phone": phone.trim(),
      };

      http.Response res = await reqPostAPIMethod(Url.signupUrl, {}, user);
      final data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        // show success message
        showSimpleNotification(msg: data['meassage']);
        // save user token
        storeStringToSF('authToken', data['token']);
        // set user provider
        final userdata = User.fromJson(data['user']);
        userProvider.setUserFromModel(userdata);
        // replace user to verify page
        pushNamedToAndRemoveUntil(
          routeName: OtpScreen.routeName,
        );
        userProvider.stopLoader();
      } else if (res.statusCode == 422) {
        showSimpleNotification(
          msg: "",
          title: "User already exists",
          color: Colors.red,
        );
      }
      userProvider.stopLoader();
    } catch (e) {
      userProvider.stopLoader();

      showSimpleNotification(msg: "Something went wrong", title: "Error");
      userProvider.isLoading = false;
    }
  }

  // logout
  void signOut(BuildContext context) async {
    storeStringToSF('authToken', '');
    pushNamedToReplace(routeName: LoginScreen.routeName);
  }

// submit otp------------
  // otp sent
  void submitotp(
    BuildContext context, {
    required String otp,
  }) async {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    //
    userprovider.startLoader();
    try {
      final body = {'email': userprovider.user.email, 'otp': otp};
      // log(body.toString());
      http.Response res = await reqPostAPIMethod(Url.otpUrl, {}, body);
      // final data = jsonDecode(res.body);
      if (res.statusCode == 404) {
        showSimpleNotification(
          msg: "User Not Found",
          title: "Verification Error",
          color: Colors.red,
        );
        userprovider.stopLoader();
      } else if (res.statusCode == 500) {
        showSimpleNotification(
          msg: "We sent it again",
          title: "otp expired",
          color: Colors.red,
        );
        // reSentOtp(userprovider.user.email.toString());
        userprovider.stopLoader();
      } else if (res.statusCode == 200) {
        userprovider.stopLoader();
        pushNamedToAndRemoveUntil(routeName: BottomBarScreen.routeName);
      } else if (res.statusCode == 501) {
        showSimpleNotification(
          msg: "",
          title: 'Otp Not currect',
          color: Colors.red,
        );
        userprovider.stopLoader();
      } else {
        showSimpleNotification(
          msg: "Something went Wrong",
          title: 'try after 10 mins',
          color: Colors.red,
        );
        userprovider.stopLoader();
      }
    } catch (e) {
      userprovider.stopLoader();
      showSimpleNotification(
        msg: "Something went wrong",
        title: "Server Error",
      );
    }
  }

// resent otp----------
  void reSentOtp(String email) async {
    try {
      final body = {'email': email};
      http.Response res = await reqPostAPIMethod(Url.resentOTPUrl, {}, body);
      if (res.statusCode == 200) {
        showSimpleNotification(msg: "", title: "Otp Resent successfully");
      } else {
        showSimpleNotification(
          msg: "Something is wrong try again",
          title: "Error in resent otp",
          color: Colors.red,
        );
      }
    } catch (e) {
      showSimpleNotification(
          msg: "Otp sent to:$email", title: "Otp sent", color: Colors.green);
    }
  }

//
  void forgetPassword(BuildContext context, String email) async {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    //
    userprovider.startLoader();
    try {
      final body = {'email': email};
      http.Response res =
          await reqPostAPIMethod(Url.forgetPasswordUrl, {}, body);
      if (res.statusCode == 200) {
        showSimpleNotification(
          msg: "check your email",
          title: "Otp sent successfully",
        );
        Future.delayed(const Duration(seconds: 2));
        pushNamedToReplace(routeName: ResetPassword.routeName, arg: email);
        userprovider.stopLoader();
      } else if (res.statusCode == 404) {
        showSimpleNotification(
          msg: "User Not Found",
          title: "Verification Error",
          color: Colors.red,
        );
        // pushNamedToAndRemoveUntil(routeName: '/signup');
      } else {
        showSimpleNotification(
          msg: "Something is wrong try again",
          title: "Error in resent otp",
          color: Colors.red,
        );
      }
      userprovider.stopLoader();
    } catch (e) {
      userprovider.stopLoader();

      showSimpleNotification(
          msg: "Otp sent to:$email", title: "Otp sent", color: Colors.green);
    }
  }

//
  void resetPassword(
      BuildContext context, String email, String password, String otp) async {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    //
    userprovider.startLoader();
    try {
      final body = {
        'email': email,
        'password': password,
        'otp': otp,
      };

      http.Response res =
          await reqPostAPIMethod(Url.resetPasswordUrl, {}, body);
      if (res.statusCode == 200) {
        showSimpleNotification(
          msg: "Your Password Changed",
          title: "Reset Password successfully",
        );
        userprovider.stopLoader();
        pushNamedToReplace(routeName: LoginScreen.routeName);
      } else {
        showSimpleNotification(
          msg: "Something is wrong try again",
          title: "Error in resent otp",
          color: Colors.red,
        );
      }
      userprovider.stopLoader();
    } catch (e) {
      userprovider.stopLoader();

      showSimpleNotification(
          msg: "Otp sent to:$email", title: "Otp sent", color: Colors.green);
    }
  }
}
