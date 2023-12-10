
import 'package:cidadania_app/app/pages/adm/dashboard/adm_dashboard_page.dart';
import 'package:cidadania_app/app/pages/adm/dashboard/profile/%5Bprofile_id%5D/adm_business_profile_page.dart';
import 'package:cidadania_app/app/pages/home/home_page.dart';
import 'package:cidadania_app/app/pages/splash_page.dart';
import 'package:cidadania_app/app/pages/resources/view_image/%5Bimage_id%5D/view_photo_page.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:routefly/routefly.dart';

import '../pages/home/profile/[profile_id]/profile_page.dart';
class RoutePages {
  static final List<RouteEntity> pages = [
    RouteEntity(
      uri:Uri.parse(RouteName.splash), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      SplashScreen(),
      ),
      key: RouteName.splash,
    ),
    RouteEntity(
      uri:Uri.parse(RouteName.home), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      HomeScreen(),
      ),
      key: RouteName.home,
    ),
    RouteEntity(
      uri:Uri.parse(RouteName.view_image), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      ViewPhotoScreen(),
      ),
      key: RouteName.view_image,
    ),
    RouteEntity(
      uri:Uri.parse(RouteName.profile), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      ProfileScreen(),
      ),
      key: RouteName.profile,
    ),
    RouteEntity(
      uri:Uri.parse(RouteName.adm_home), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
        ctx,
        settings,
        AdmHomeScreen(),
      ),
      key: RouteName.adm_home,
    ),
    RouteEntity(
      uri:Uri.parse(RouteName.adm_business), 
      routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      AdmBusinessScreen(),
      ),
      key: RouteName.adm_business,
    ),
  ];
}
