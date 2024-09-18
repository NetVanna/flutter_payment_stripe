import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method/constants.dart'; // Make sure your constant file contains the stripeSecretKey

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(String amount) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(amount, "USD");
      if (paymentIntentClientSecret == null) return;

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Vanna Net",
        ),
      );

      // Present the payment sheet
      await _processPayment();
    } catch (e) {
      print('Error in makePayment: $e');
    }
  }

  Future<String?> _createPaymentIntent(String amount, String currency) async {
    try {
      final Dio dio = Dio();

      // Prepare the payment intent data
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
        "payment_method_types[]": ["card"], // Move this to request data
      };

      // Perform the POST request to create a PaymentIntent
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      // Check if the response contains the client secret
      if (response.data != null) {
        return response.data["client_secret"];
      }

      return null;
    } catch (e) {
      print('Error in _createPaymentIntent: $e');
    }
    return null;
  }

  Future<void> _processPayment() async {
    try {
      // Present the payment sheet to the user
      await Stripe.instance.presentPaymentSheet();
      print('Payment successful');
    } catch (e) {
      print('Error in _processPayment: $e');
    }
  }

  // Calculate the amount in the smallest currency unit (e.g., cents)
  String _calculateAmount(String amount) {
    final calculateAmount = (int.parse(amount) * 100); // Convert to integer (cents)
    return calculateAmount.toString();
  }
}
