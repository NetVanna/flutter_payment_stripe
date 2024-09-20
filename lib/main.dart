import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/admin/all_orders.dart';
import 'package:payment_method/constants.dart';
import 'package:payment_method/pages/onboarding_screen.dart';

void main() async{
  await _setUp();
  runApp(const MyApp());
}

Future<void> _setUp() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey= stripePublishKey;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
