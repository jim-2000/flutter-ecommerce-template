import 'package:flutter/foundation.dart';

class Url {
  static String sandboxDomain = "http://192.168.0.105";
  static String port = '4000';
  // static String baseUrl = 'http://192.168.0.104:$port/api';
  static String baseUrl = 'https://mern-hotel.onrender.com/api';

  static String authbaseURl = "$baseUrl/auth";
  static String roombaseURl = "$baseUrl/rooms";
  static String bookaseURl = "$baseUrl/booking";
  static String hotelbaseURl = "$baseUrl/hottle";
  static String myHotelURL = "$hotelbaseURl/myHotel";
  // static String hotelUrl = "${baseUrl}/hottle/public/Product_image/";
  //
  static String verifyTokenUrl = "$authbaseURl/checkToken";
  static String signupUrl = "$authbaseURl/register";
  static String logUrl = "$authbaseURl/login";
  static String otpUrl = "$authbaseURl/otpVerify";
  static String resentOTPUrl = "$authbaseURl/resendOtp";
  static String forgetPasswordUrl = "$authbaseURl/forgotPassword";
  static String resetPasswordUrl = "$authbaseURl/resetPassword";
  //
  static String getAllroom = "$roombaseURl/";
  static String bookroom = "$bookaseURl/booked";
}
