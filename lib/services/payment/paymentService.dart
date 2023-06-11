import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class PaymentService {
  // create payment service
  createPaymentIntent(int amount, String email) async {
    try {
      final body = {
        'amount': calculateString(amount),
        'currency': 'USD',
        'payment_method_types[]': 'card',
        'receipt_email': email,
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ' +
              'sk_test_51HyfPxG2v0f9y0mmYM80cvb5VudtLskbted9TYIaYt0LSH6lxVMkeWAoyklS3IJuIvHLRYygIx6FzBC1OER6zLIr00W4cxQ7bW'
        },
        body: body,
      );
      log(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  //
  createCheckout(int amount) async {
    final auth =
        'Basic ${base64Encode(utf8.encode('sk_test_51HyfPxG2v0f9y0mmYM80cvb5VudtLskbted9TYIaYt0LSH6lxVMkeWAoyklS3IJuIvHLRYygIx6FzBC1OER6zLIr00W4cxQ7bW'))}';
    final body = {
      'payment_method_types': ['card'],
      'line_items': [
        {
          'price': calculateString(amount),
          'quantity': '1',
        }
      ],
      'mode': 'payment',
      'success_url': 'https://success.com/$auth',
      'cancel_url': 'https://cancel.com/',
    };
    try {
      final result = await http.post(
        Uri.parse("https://api.stripe.com/v1/checkout/sessions"),
        body: body,
      );
      log(result.statusCode.toString());
      return jsonDecode(result.body);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }

  // calculated amount
  calculateString(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
