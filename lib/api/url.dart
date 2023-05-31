import 'package:flutter/foundation.dart';

class Url {
  static String sandboxDomain = "http://192.168.0.105";
  static String port = '4000';
  static String baseUrl = 'https://easy-shop-tis9.onrender.com/api/v1';
  // static String baseUrl = 'http://192.168.0.104:$port/api';----------

  static String authbaseURl = "$baseUrl/auth";
  static String catagoribaseURl = "$baseUrl/catagories";
  static String productbaseURl = "$baseUrl/products";
  static String orderbaseURl = "$baseUrl/order";

  //atuh
  static String verifyTokenUrl = "$authbaseURl/";
  static String signupUrl = "$authbaseURl/register";
  static String logUrl = "$authbaseURl/login";
  static String otpUrl = "$authbaseURl/otpVerify";
  static String resentOTPUrl = "$authbaseURl/resendOtp";
  static String forgetPasswordUrl = "$authbaseURl/forgotPassword";
  static String resetPasswordUrl = "$authbaseURl/resetPassword";
  // catagories
  static String getAllCatagori = "$catagoribaseURl/";
  //
  static String getAllProducts = "$productbaseURl/";
  static String getSingelProduct = "$productbaseURl/";
  //
  static String getmyOrder = "$orderbaseURl/me";
  static String newOrder = "$orderbaseURl/new";
}
