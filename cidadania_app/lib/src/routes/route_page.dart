import 'package:cidadania_app/src/blinds/core_blinds.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/screens/adm/adm_business_screen.dart';
import 'package:cidadania_app/src/screens/adm/adm_home_screen.dart';
import 'package:cidadania_app/src/screens/home_screen.dart';
import 'package:cidadania_app/src/screens/login_screen.dart';
import 'package:cidadania_app/src/screens/profile_screen.dart';
import 'package:cidadania_app/src/screens/splash_screen.dart';
import 'package:get/get.dart';
class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm,
      page: () => LoginScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm_home,
      page: () => AdmHomeScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm_business,
      page: () => AdmBusinessScreen(),
      binding: CoreBlinds(),
      transition: Transition.noTransition,
    ),
  ];
}
