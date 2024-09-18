import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/constants.dart';
import 'package:payment_method/stripe/home_screen_stripe.dart';

void main() async{
  await _setUp();
  runApp(const MyApp());
}

Future<void> _setUp() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey= stripePublishKey;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenStripe(),
    );
  }
}
