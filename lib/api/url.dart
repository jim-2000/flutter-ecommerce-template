class Url {
  static String sandboxDomain = "http://192.168.0.105";
  static String port = '4000';
  static String baseUrl = 'https://easy-shop-tis9.onrender.com/api/v1';
  static String localhost = 'http://192.168.0.104:$port/api/v1';
  // static String baseUrl = 'http://192.168.0.104:$port/api/v1';

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
  static String getProductCatagori = "$productbaseURl/cat/";
  //order
  static String getmyOrder = "$orderbaseURl/user/me";
  static String newOrder = "$orderbaseURl/new";

  // payment intent
  static String paymentIntent = "$baseUrl/payment/process";
  // "$localhost/payment/process";
}
