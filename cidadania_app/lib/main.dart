import 'package:cidadania_app/src/blinds/core_blinds.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/routes/route_page.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NnUjqLwTkJZWVNHVjfuw6wgX3AwjuwpVHImsoUGLDlRPdIt1o8Bn5nbz2aY1y8zc4Y2ndW50JRp60oFFnSpJD6I009tQfq6hj";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cidadania',
      getPages: RoutePages.pages,
      initialBinding: CoreBlinds(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: CustomColors.cardBackgroud,
        ),
        scaffoldBackgroundColor: CustomColors.backgroudColor,
      ),
    );
  }
}
