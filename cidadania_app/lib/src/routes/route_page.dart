import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/screens/home_screen.dart';
import 'package:cidadania_app/src/screens/login_screen.dart';
import 'package:cidadania_app/src/screens/profile_screen.dart';
import 'package:cidadania_app/src/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/adm/adm_add_profile_screen.dart';
import '../screens/adm/adm_edit_profile_screend.dart';
import '../screens/adm/adm_home_screen.dart';

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfileScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm_home,
      page: () => AdmHomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm_add,
      page: () => AdmAddProfileScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.adm_edit,
      page: () => AdmEditProfileScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
