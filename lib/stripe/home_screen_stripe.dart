import 'package:flutter/material.dart';
import 'package:payment_method/services/stripe_service.dart';

class HomeScreenStripe extends StatefulWidget {
  const HomeScreenStripe({super.key});

  @override
  State<HomeScreenStripe> createState() => _HomeScreenStripeState();
}

class _HomeScreenStripeState extends State<HomeScreenStripe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stripe Payment Demo",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            StripeService.instance.makePayment();
          },
          style: ElevatedButton.styleFrom(
            shape: const ContinuousRectangleBorder(),
            backgroundColor: Colors.green,
            foregroundColor: Colors.black
          ),
          child: const Text("Purchase"),
        ),
      ),
    );
  }
}
