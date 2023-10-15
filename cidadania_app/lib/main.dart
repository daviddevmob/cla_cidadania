import 'package:cidadania_app/src/blinds/core_blinds.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/routes/route_page.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
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
