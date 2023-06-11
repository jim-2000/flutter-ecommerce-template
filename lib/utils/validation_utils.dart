bool validateName(String text) {
  return text
      .contains(new RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"));
}

bool validateNumber(String text) {
  var pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(text);
}

bool validateEmail(String text) {
  var pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(text);
}

bool validatePassword(String text) {
  return text.toString().length >= 6;
}

bool validateIsFieldFilled(String text) {
  return text.toString().length != 0;
}

bool validateIsPhoneNumber(String text) {
  return text.toString().length == 10;
}

bool validateIs6DigitOTP(String text) {
  return text.toString().length == 6;
}

bool validateChequeNumber(String text) {
  return (text.toString().length != 0 && text.toString().length == 6);
}

bool isNotBlank(String string) {
  return (string != null) ? (string.trim() != '') : false;
}

bool isBlank(String string) {
  // ignore: unnecessary_null_comparison
  return (string != null) ? (string.trim() == '') : true;
}
