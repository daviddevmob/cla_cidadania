import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:routefly/routefly.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final BusinessController businessController = GetIt.I.get<BusinessController>();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value)async {
      Routefly.navigate(RouteName.home);
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
