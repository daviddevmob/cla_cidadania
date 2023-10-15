import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';
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
      Get.toNamed(RouteName.adm);
       /* await businessController.getAllBusiness();
      Get.off(() => HomeScreen()); */
    });
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
