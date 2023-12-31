import 'package:cidadania_app/app/routes/route_middleware.dart';
import 'package:cidadania_app/app/routes/route_page.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app_injectors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routefly/routefly.dart';


void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCAgF-aiBoJxMjvrlQxBH0K9rYcqEbLNuY",
      authDomain: "coletivo-alpha.firebaseapp.com",
      projectId: "coletivo-alpha",
      storageBucket: "coletivo-alpha.appspot.com",
      messagingSenderId: "528540681578",
      appId: "1:528540681578:web:af2b252450d674fd765113",
      measurementId: "G-S368MHRX52"
    ),
  );
  AppIntectors.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cidadania',
      routerConfig: Routefly.routerConfig(
        routes: RoutePages.pages,
        middlewares: [AppRouteMiddleware().guardRoute]
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: CustomColors.cardBackgroud,
        ),
        scaffoldBackgroundColor: CustomColors.backgroudColor,
      ),
    );
  }
}
