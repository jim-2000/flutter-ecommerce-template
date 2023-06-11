import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey =
      'pk_test_51HyfPxG2v0f9y0mmO4iCyDOkmOvviPOgV3N5FhKZKrIDJjMDDKmGjTUtR2SEPN0B20zYIIcSizMlTaWRAL0JmaXm00ijtjVNFU';

  await Stripe.instance.applySettings();
  runApp(const App());
}
