import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/business/business_repository.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final BusinessController businessController = Get.find();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value)async {
       await businessController.getAllBusiness();
      Get.offAllNamed(RouteName.home);
    });
  }

  Future<String?> generateStripePaymentMethodId() async {
    try{
      final stripe = Stripe.instance;
      final cardDetails = CardDetails(
        number: "4242424242424242",
        expirationMonth: 12,
        expirationYear: 40,
        cvc: "123",
      );
      await stripe.dangerouslyUpdateCardDetails(cardDetails);
      final billingDetails = BillingDetails(
          email: "xpangopsp@gmail.com",
          name: "David Fernandes de Abreu",
          address: Address(
            city: "Eusébio",
            country:"BR",
            line1:  "Rua Francisco Calado de Souza",
            line2: '',
            state:  "Ceará",
            postalCode:  "61760000",
          ),
        );
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(billingDetails: billingDetails),
        ),
      );
      return paymentMethod.id;
    }catch(e){
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/logo.json',
              height: 200,
              fit: BoxFit.contain,
              repeat: false,
            ),
            Text(
              "Coletivo Alpha",
              style: CustomStyle.title.copyWith(
                color: CustomColors.textColor,
                fontSize: 30
              ),
            ),
          ],
        ),
      ),
    );
  }
}
